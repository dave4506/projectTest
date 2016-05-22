//
//  look.swift
//  trialProkect
//
//  Created by Dav Sun on 5/21/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation

enum Look {
    case Empty
    case Request
    case Fetched(Dictionary<String,AnyObject>)
    case Error(Dictionary<String,AnyObject>)
}