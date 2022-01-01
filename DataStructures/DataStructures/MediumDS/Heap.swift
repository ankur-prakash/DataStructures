//
//  Heap.swift
//  DataStructures
//
//  Created by Ankur Prakash on 01/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation

public struct Heap<Element: Equatable> {
    
    public typealias SortFunction = (Element, Element) -> Bool
    private(set) var _elements: [Element]
    private(set) var _sortFunc: SortFunction
    
    public init(_ sort: @escaping SortFunction, elements: [Element] = []) {
        self._elements = elements
        self._sortFunc = sort
        if !_elements.isEmpty {
            heapify()
        }
    }
    
    /// Heapify is a process where we accept any array and convert to heap
    private mutating func heapify() {
        for i in (0..<numberOfParentsInHeap).reversed() {
            shiftDown(from: i)
        }
    }
    
    public mutating func remove(at index: Int) -> Element? {
        return nil
    }
    
    public mutating func remove() -> Element? {
        guard !isEmpty else {
            return nil
        }
        _elements.swapAt(0, count - 1)
        defer {
            shiftDown(from: 0)
        }
        return _elements.removeLast()
    }
    
    public mutating func append(_ value: Element) {
        _elements.append(value)
        shiftUp(from: count - 1)
    }
}

private extension Heap {
    /// Logic of shiftUp func is that child will be compared with parent, based on the priority swap will happen and it will go till child > 0, When child is 0, it means it became root
    mutating func shiftUp(from index: Int) {
        var childIndex = index
        while childIndex > 0 {
            let parentIndex = parentIndex(for: childIndex)
            if _sortFunc(_elements[childIndex], _elements[parentIndex]) {
                _elements.swapAt(childIndex, parentIndex)
            }
            childIndex = parentIndex
        }
    }
    
    mutating func shiftDown(from index: Int) {
        var parentIndex = index
        while true {
            let left = leftChildIndex(for: parentIndex)
            let right = rightChildIndex(for: parentIndex)
            var whoShouldGoUpIndex = parentIndex
            if left < count && _sortFunc(_elements[left], _elements[whoShouldGoUpIndex]) {
                whoShouldGoUpIndex = left
            }
            // check which child have highest priority
            if right < count && _sortFunc(_elements[right], _elements[whoShouldGoUpIndex]) {
                whoShouldGoUpIndex = right
            }
            if whoShouldGoUpIndex == parentIndex { break } // no one needed to come down
            _elements.swapAt(whoShouldGoUpIndex, parentIndex) // now whoShouldGoUpIndex is parent
            parentIndex = whoShouldGoUpIndex
        }
    }
}

public extension Heap {

    var isEmpty: Bool { _elements.isEmpty }
    var peek: Element? { _elements.first }
    var count: Int { _elements.count }
    var numberOfParentsInHeap: Int { count/2 }
}

public extension Heap {
    
    func parentIndex(for child: Int) -> Int {
        (child - 1)/2
    }
    
    func leftChildIndex(for parent: Int) -> Int {
        2 * parent + 1
    }
    
    func rightChildIndex(for parent: Int) -> Int {
        2 * parent + 2
    }
}
