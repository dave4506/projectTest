
//
//  AppReducer..swift
//  trialProkect
//
//  Created by Dav Sun on 5/20/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation
import ReSwift

struct AppReducer: Reducer {
    
    func handleAction(action: Action, state: State?) -> State {
        return State(
            current_user: "xi-liu1",
            current_look: currentLookReducer(state?.current_look,action: action),
            looks_history: lookHistoryReducer(state?.looks_history, action: action),
            bottom_view_state: bottomViewReducer(state?.bottom_view_state, action: action),
            current_product: currentProductReducer(state?.current_product, action: action),
            current_similar_products: currentSimilarProductsReducer(state?.current_similar_products, action: action)
        );
    }
    
}