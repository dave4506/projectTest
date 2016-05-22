//
//  current_product.swift
//  trialProkect
//
//  Created by Dav Sun on 5/21/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation
import ReSwift

func currentProductReducer(state: Product?, action: Action) -> Product {
    var state = state ?? .Empty
    switch action {
    case let lookAction as SetCurrentProduct:
        return lookAction.product
    default:break;
    }
    return state
}