//
//  current_similiar_products.swift
//  trialProkect
//
//  Created by Dav Sun on 5/21/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation
import ReSwift

func currentSimilarProductsReducer(state: SimilarProduct?, action: Action) -> SimilarProduct {
    var state = state ?? .Empty
    switch action {
    case let similarAction as SetSimilarProducts:
        return similarAction.products
    default:break;
    }
    return state;
}