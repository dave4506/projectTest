//
//  appState.swift
//  trialProkect
//
//  Created by Dav Sun on 5/21/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation
import ReSwift

struct State: StateType {
    var current_user: String
    var current_look: Look
    var looks_history: Array<String>
    var bottom_view_state: BottomViewState
    var current_product: Product
    var current_similar_products: SimilarProduct
}