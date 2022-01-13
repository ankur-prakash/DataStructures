//
//  Graph.swift
//  DataStructures
//
//  Created by Ankur Prakash on 01/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation

public protocol Graph {
    associatedtype Element
    func createVertex(_ data: Element) -> Vertex<Element>
    func addDirectedEdge(source: Vertex<Element>, destination: Vertex<Element>, weight: Double?)
//    func addUndirectedEdge(source: Vertex<Element>, destination: Vertex<Element>, weight: Double?)
//    func add(_ edgeType: EdgeType, source: Vertex<Element>, destination: Vertex<Element>, weight: Double?)
//    func edges(from source: Vertex<Element>) -> [Edge<Element>]
//    func weight(from source: Vertex<Element>, destination: Vertex<Element>) -> Double?
}


extension Graph {
    
    public func add(_ edgeType: EdgeType, source: Vertex<Element>, destination: Vertex<Element>, weight: Double?) {
        switch edgeType {
        case .directed:
            addDirectedEdge(source: source, destination: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(source: source, destination: destination, weight: weight)
        }
    }
    
    public func addUndirectedEdge(source: Vertex<Element>, destination: Vertex<Element>, weight: Double?) {
        
        addDirectedEdge(source: source, destination: destination, weight: weight)
        addDirectedEdge(source: destination, destination: source, weight: weight)
    }
}
