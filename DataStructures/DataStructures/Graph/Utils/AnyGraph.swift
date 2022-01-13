//
//  AnyGraph.swift
//  DataStructures
//
//  Created by Ankur Prakash on 11/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation

public class AnyGraph<AnyElement>: Graph {
 
    
    private let addDirectedEdgeClosure: (Vertex<AnyElement>, Vertex<AnyElement>, Double?) -> Void
    private let createVertexClosure: (Element) -> Vertex<AnyElement>

    init<T: Graph>(_ configurable: T) {
        addDirectedEdgeClosure = { a, b, c in
            guard let a = a as? Vertex<T.Element>, let b = b as? Vertex<T.Element> else {
                return
            }
            configurable.addDirectedEdge(source: a, destination: b, weight: c)
        }
        
        createVertexClosure = { data in
            guard let tData = data as? T.Element else {
                fatalError("")
            }
            return configurable.createVertex(tData)
        }
    }
    
    public func createVertex(_ data: AnyElement) -> Vertex<AnyElement> {
        createVertexClosure(data)
    }
    
    public func addDirectedEdge(source: Vertex<AnyElement>,
                                destination: Vertex<AnyElement>, weight: Double?) {
        addDirectedEdgeClosure(source, destination,weight)
    }
    
//    public func edges(from source: Vertex<Element>) -> [Edge<Element>] {
//        <#code#>
//    }
//
//    public func weight(from source: Vertex<Element>, destination: Vertex<Element>) -> Double? {
//        <#code#>
//    }
}
