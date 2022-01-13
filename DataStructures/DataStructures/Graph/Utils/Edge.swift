//
//  Edge.swift
//  DataStructures
//
//  Created by Ankur Prakash on 01/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation

public struct Edge<Element> {
    
    public let source:Vertex<Element>
    public let destination: Vertex<Element>
    public let weight: Double?
    
    public init(source: Vertex<Element>,
                destination: Vertex<Element>, weight: Double? = nil) {
        self.source = source
        self.destination = destination
        self.weight = weight
    }
}

extension Edge: CustomStringConvertible {
    public var description: String { "\(source) -> \(destination) \(weight ?? 0.0)" }
}
