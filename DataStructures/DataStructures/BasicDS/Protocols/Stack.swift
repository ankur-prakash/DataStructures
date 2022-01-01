//
//  Stack.swift
//  DataStructures
//
//  Created by Ankur Prakash on 01/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation

public protocol Stack {

    associatedtype Element
    mutating func push(_ value: Element)
    mutating func pop() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}
