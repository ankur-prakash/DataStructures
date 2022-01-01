//
//  QueueADT.swift
//  DataStructures
//
//  Created by Ankur Prakash on 01/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation

public struct QueueADT<Element> {
    
    private var _linkedList = LinkListADT<Element>()
    public init() {}
}

extension QueueADT: Queue {
    
    public mutating func enqueue(_ value: Element) {
        _linkedList.append(value)
    }
    
    public mutating func dequeue() -> Element? {
        _linkedList.pop()
    }
    
    public var peek: Element? { _linkedList.peek }
    public var isEmpty: Bool { _linkedList.isEmpty }
}
