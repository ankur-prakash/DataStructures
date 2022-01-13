//
//  PriorityQueue.swift
//  DataStructures
//
//  Created by Ankur Prakash on 01/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation

public struct PriorityQueue<Element: Equatable> {
    
    private var _heap: Heap<Element>
    public typealias SortFunction = (Element, Element) -> Bool
    public init(_ sort: @escaping SortFunction) {
        self._heap = Heap<Element>(sort)
    }
    
    public var count: Int { _heap.count }
}

extension PriorityQueue: Queue {
    
    public mutating func enqueue(_ value: Element) {
        _heap.append(value)
    }
    
    public mutating func dequeue() -> Element? {
        _heap.remove()
    }
    
    public var peek: Element? { _heap.peek }
    public var isEmpty: Bool { _heap.isEmpty }
}
