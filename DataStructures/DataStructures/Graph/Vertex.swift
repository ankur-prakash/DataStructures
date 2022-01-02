//
//  File.swift
//  DataStructures
//
//  Created by Ankur Prakash on 01/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation

public struct Vertex<Element> {
    private(set) var index: Int
    public var data: Element
    
    public init(index: Int, data: Element) {
        self.index = index
        self.data = data
    }
}

//For adjacencyList Vertex needs to be Hashtable(immutable)
extension Vertex:Hashable where Element: Hashable {}
extension Vertex:Equatable where Element:Equatable {}

extension Vertex: CustomStringConvertible {
    public var description: String { "\(data)" }
}
