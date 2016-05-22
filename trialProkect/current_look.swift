//
//  current_look.swift
//  trialProkect
//
//  Created by Dav Sun on 5/21/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation
import ReSwift

func currentLookReducer(state: Look?, action: Action) -> Look {
    var state = state ?? .Empty
    switch action {
        case let lookAction as SetLook:
            return lookAction.look
        /*
        case let switchAction as SwitchProductInLook:
            if case let .Fetched(look) = state {
                var products = look["products"] as! Array<Dictionary<String,AnyObject>>
                loop:
                for (i,product) in enumerate(products) {
                    if(product["id"] as! String == switchAction.replaceProductId){
                        products[i]=switchAction.product
                        look["products"] = products
                        break loop
                    }
                }
                return .Fetched(look)
            }
        */
        default:
            return state
    }
}