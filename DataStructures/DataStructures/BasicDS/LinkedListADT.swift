//
//  LinkedListADT.swift
//  DataStructures
//
//  Created by Ankur Prakash on 01/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation

public enum Errors: Error {
    case indexOutOfBounds
}

fileprivate class Node<Element> {
    
    var value: Element
    var next: Node<Element>?
    
    init(_ value: Element, next: Node<Element>? = nil) {
        self.value = value
        self.next = next
    }
}

public struct LinkListADT<Element> {
    
    private var _head: Node<Element>?
    private var _tail: Node<Element>?
    
    public init() {}
}


extension LinkListADT: LinkedList {

    public mutating func push(_ value: Element) {
        _head = Node(value, next: _head)
        if _head?.next == nil {
            _tail = _head
        }
    }
    
    public mutating func pop() -> Element? {
        defer {
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
        _tail?.next = Node(value)
        _tail = _tail?.next
    }
    
    public var peek: Element? { _head?.value }
    public var isEmpty: Bool { _head == nil }
    
    public mutating func removeLast() -> Element? {
        guard !isEmpty else {
            return nil
        }
        guard _head?.next != nil else {
            return pop()
        }
        defer {
            var current = _head
            var prev = _head
            while current?.next != nil {
                prev = current
                current = current?.next
            }
            prev?.next = nil
            _tail = prev
        }
        return _tail?.value
    }
    
    public mutating func removeNode(at index: Int) throws -> Element? {
        guard index >= 0 else {
            throw Errors.indexOutOfBounds
        }
        guard index == 0 else {
            return pop()
        }
        guard let node = try? node(at: index - 1) else {
            throw Errors.indexOutOfBounds
        }
        guard node.next != nil else {
            return removeLast()
        }
        defer {
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
    public mutating func insert(_ value: Element, at index: Int) throws {
        guard index >= 0 else {
            throw Errors.indexOutOfBounds
        }
        guard index > 0 else {
            return push(value)
        }
        guard let node = try? node(at: index - 1) else {
            throw Errors.indexOutOfBounds
        }
        node.next = Node(value, next: node.next)
    }
}


private extension LinkListADT {
    
    func node(at index: Int) throws -> Node<Element>? {
        guard index >= 0 else {
            throw Errors.indexOutOfBounds
        }
        var current = _head
        var localIndex = 0
        while current != nil {
            if localIndex == index {
                return current
            }
            localIndex += 1
            current = current?.next
        }
        throw Errors.indexOutOfBounds
    }
}
