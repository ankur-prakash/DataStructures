//
//  DoublyLinkedListADT.swift
//  DataStructures
//
//  Created by Ankur Prakash on 01/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation

fileprivate class DLLNode<Element> {
  
    var value: Element
    var next: DLLNode<Element>?
    var prev: DLLNode<Element>?
    
    init(_ value: Element, prev: DLLNode<Element>? = nil, next: DLLNode<Element>? = nil) {
        self.value = value
        self.prev = prev
        self.next = next
    }
}

public struct DoublyLinkedListADT<Element> {
    
    private var _head: DLLNode<Element>?
    private var _tail: DLLNode<Element>?

    public init() {}
}


extension DoublyLinkedListADT: LinkedList {
   
    public var peek: Element? { _head?.value }
    public var isEmpty: Bool { _head == nil }
    
    public mutating func push(_ value: Element) {
        _head = DLLNode(value, prev: nil, next: _head)
        if _head?.next == nil {
            _tail = _head
        }
    }
    
    public mutating func pop() -> Element? {
        defer {
            _head?.next?.prev = nil
            _head = _head?.next
            if _head == nil {
                _tail = nil
            }
        }
        return _head?.value
    }
    
    public mutating func append(_ value: Element) {
        guard !isEmpty else {
            push(value)
            return
        }
        _tail?.next = DLLNode(value, prev: _tail, next: nil)
        _tail = _tail?.next
    }
    
    public mutating func insert(_ value: Element, at index: Int) throws {
        guard index >= 0 else {
            throw Errors.indexOutOfBounds
        }
        guard index > 0 else {
            push(value)
            return
        }
        guard let node = node(at: index - 1) else {
            throw Errors.indexOutOfBounds
        }
        let newNode = DLLNode(value, prev: node, next: node.next)
        node.next = newNode
        newNode.next?.prev = newNode
    }
    ///- Complexity: O(1)
    public mutating func removeLast() -> Element? {
        guard !isEmpty else {
            return nil
        }
        guard _head?.next != nil else {
            return pop()
        }
        defer {
            _tail = _tail?.prev
            if _tail == nil {
                _head = nil
            } else {
                _tail?.next = nil
            }
        }
        return _tail?.value
    }
    
    public mutating func removeNode(at index: Int) throws -> Element? {
        guard index > 0 else {
            if index == 0 {
                return pop()
            } else {
                throw Errors.indexOutOfBounds
            }
        }
        guard let node = node(at: index - 1) else {
            throw Errors.indexOutOfBounds
        }
        guard node.next != nil else {
            return removeLast()
        }
        defer {
            node.next = node.next?.next
            node.next?.prev = node
        }
        return node.next?.value
    }
    
}

private extension DoublyLinkedListADT {
    
    func node(at index: Int) -> DLLNode<Element>? {
        
        guard index >= 0 else {
            return nil
        }
        var current = _head
        var localIndex = 0
        while current != nil {
            if localIndex == index { return current }
            localIndex += 1
            current = current?.next
        }
        return nil
    }
}
