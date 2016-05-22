//
//  middleware.swift
//  trialProkect
//
//  Created by Dav Sun on 5/21/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation
import ReSwift

let loggingMiddleware: Middleware = { dispatch, getState in
    return { next in
        return { action in
            print("😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀")//just so its easy to see
            if(debugLog=="minimal"){
                print(action.dynamicType)                
            }else{
                print(action)
            }
            return next(action)
        }
    }
}