//
//  StackADT.swift
//  DataStructures
//
//  Created by Ankur Prakash on 01/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation

public struct StackADT<Element> {
    private var _elements = [Element]()
    public init(_ elements: [Element] = []) {
        self._elements = elements
    }
}

extension StackADT: Stack {
    
    public mutating func push(_ value: Element) {
        _elements.append(value)
    }
    
    public mutating func pop() -> Element? {
        guard !isEmpty else {
            return nil
        }
        return _elements.removeLast()
    }
    
    public var peek: Element? { _elements.last }
    public var isEmpty: Bool { _elements.isEmpty }

}
