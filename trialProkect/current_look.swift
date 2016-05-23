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
        case let switchAction as SwitchProductInLook:
            if case let .Fetched(look) = state {
                var newLook = look;
                var products = newLook["products"] as! Array<Dictionary<String,AnyObject>>
                loop:
                for (i,product) in products.enumerate() {
                    if(product["id"] as! String == switchAction.replaceProductId){
                        products[i] = switchAction.product
                        newLook["products"] = products
                        break loop
                    }
                }
                return .Fetched(newLook)
            }
        default:break;
    }
    return state;
}