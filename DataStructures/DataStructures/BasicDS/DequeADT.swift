//
//  DequeADT.swift
//  DataStructures
//
//  Created by Ankur Prakash on 01/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation

public struct DequeADT<Element> {
    
    private var _doublyLinkedList = DoublyLinkedListADT<Element>()
    public init() {}
}

extension DequeADT: Deque {

    public mutating func enqueue(_ value: Element) {
        _doublyLinkedList.append(value)
    }
    
    public mutating func dequeue() -> Element? {
        _doublyLinkedList.pop()
    }
    public var peek: Element? { _doublyLinkedList.peek }
    public var isEmpty: Bool  { _doublyLinkedList.isEmpty }
    
    public mutating func insertFront(_ value: Element) {
        _doublyLinkedList.push(value)
    }
    
    public mutating func removeRear() -> Element? {
        _doublyLinkedList.removeLast()
    }
}
