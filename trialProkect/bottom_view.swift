//
//  bottom_view.swift
//  trialProkect
//
//  Created by Dav Sun on 5/21/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation
import ReSwift

func bottomViewReducer(state: BottomViewState?, action: Action) -> BottomViewState {
    let state = state ?? .Inspiration
    switch action {
    case let btmAction as SwitchBottomView:
        return btmAction.switchTo
    default:
        return state
    }
}