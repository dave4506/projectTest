//
//  similarProducts.swift
//  trialProkect
//
//  Created by Dav Sun on 5/21/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation

enum SimilarProduct {
    case Empty
    case Request
    case Fetched(Array<Dictionary<String,AnyObject>>)
    case Error(Dictionary<String,AnyObject>)
}

enum Product {
    case Empty
    case Request(String)
    case Fetched(Dictionary<String,AnyObject>)
}