//
//  DequeADT.swift
//  DataStructures
//
//  Created by Ankur Prakash on 01/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation

public struct Deque<Element> {
    
    private var _doublyLinkedList = DoublyLinkedListADT<Element>()
    public init() {}
}

extension Deque: LinkedList {
    
    public var peek: Element? { _doublyLinkedList.peek }
    public var isEmpty: Bool { _doublyLinkedList.isEmpty }
    
    
    public func push(_ value: Element) {
        
    }
    
    public func pop() -> Element? {
        return nil
    }
    
    public func append(_ value: Element) {
        
    }
    public func insert(_ value: Element, at index: Int) {
        
    }
    
    public func removeLast() -> Element? {
        return nil
    }
    
    public func removeNode(at index: Int) -> Element? {
        return nil
    }
    
}
