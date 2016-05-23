//
//  looks.swift
//  trialProkect
//
//  Created by Dav Sun on 5/21/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation
import ReSwift
import Alamofire

func fetchLooks(state: State, store: Store<State>) -> Action? {
    Alamofire.request(.POST,"https://test.flaunt.peekabuy.com/api/look/create_looks_from_closet_with_anchors/",parameters:["username":state.current_user,"prev_look_ids":state.looks_history])
        .responseJSON { response in
            store.dispatch(SetLook(look:.Request))
            if let json = response.result.value!["looks"] as! Array<Dictionary<String,AnyObject>>! {
                dispatch_async(dispatch_get_main_queue()) {
                    store.dispatch(SetLook(look:.Fetched(json[0]))) //assume only gets one look
                }
            }
        }
    return nil
}

struct SetLook: Action {
    var look: Look
}

struct SwitchBottomView: Action {
    var switchTo: BottomViewState
}

struct SetCurrentProduct: Action {
    var product: Product
}

struct SetSimilarProducts: Action {
    var products: SimilarProduct
}

func fetchCurrentProduct(state: State, store: Store<State>) -> Action? {
    guard case let .Request(productId) = state.current_product  else { return nil }
    guard case let .Fetched(look) = state.current_look  else { return nil }
    loop:
    for product in look["products"] as! Array<AnyObject> {
        print(product["id"])
        if product["id"] as! String == productId {
            store.dispatch(SetCurrentProduct(product: .Fetched(product as! Dictionary<String,AnyObject>)))
            break loop
        }
    }
    return nil
}

func fetchSimilarProducts(state: State, store: Store<State>) -> Action? {
    guard case let .Fetched(product) = state.current_product  else { return nil }
    Alamofire.request(.GET,"https://test.flaunt.peekabuy.com/api/look/get_similar_products/",parameters:["username":state.current_user,"product_id":product["id"] as! String])
        .responseJSON { response in
            store.dispatch(SetSimilarProducts(products:.Request))
            if let json = response.result.value!["products"] as! Array<Dictionary<String,AnyObject>>! {
                dispatch_async(dispatch_get_main_queue()) {
                    store.dispatch(SetSimilarProducts(products:.Fetched(json)))
                }
            }
    }
    return nil
}

struct SwitchProductInLook: Action {
    var product: Dictionary<String,AnyObject>
    var replaceProductId: String
}