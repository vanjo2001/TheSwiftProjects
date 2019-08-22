//
//  TryCatchEx.swift
//  BridgePatternInPractice
//
//  Created by IvanLyuhtikov on 8/14/19.
//  Copyright © 2019 IvanLyuhtikov. All rights reserved.
//

import Foundation

enum MyError: Int, Error {
    case negativeValue = 1
    case zeroValue = 0
    case Wednesday = 3
}

public func checkValue(_ value: Int) throws -> Int {
    guard value != 0 else { throw MyError.zeroValue }
    guard value > 0 else { throw MyError.negativeValue }
    if value != 3 {
        return value
    } else {
        throw MyError.Wednesday
    }
}

