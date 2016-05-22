//
//  looks_history.swift
//  trialProkect
//
//  Created by Dav Sun on 5/21/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation
import ReSwift

func lookHistoryReducer(state: Array<String>?, action: Action) -> Array<String> {
    var state = state ?? []
    switch action {
        case let lookAction as SetLook:
            if case let .Fetched(look) = lookAction.look {
                state.append(look["id"] as! String)
                return state
            }
        default:break;
    }
    return state
}