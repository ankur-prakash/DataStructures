//
//  AdjacencyMatrix.swift
//  DataStructures
//
//  Created by Ankur Prakash on 11/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation

public class AdjacencyMatrix<Element> {
    /// It contains list of vertices and matrix for edge info
    private(set) var vertices = [Vertex<Element>]()
    /// 2-D Double array
    private(set) var weights = [[Double?]]()
    
    public init() {}
}

extension AdjacencyMatrix: Graph {
    
    public func createVertex(_ data: Element) -> Vertex<Element> {
        let vertex = Vertex(index: vertices.count, data: data)
        vertices.append(vertex)
        for i in 0..<weights.count {
            weights[i].append(nil)
        }
        weights.append(Array(repeating: nil, count: vertices.count))
        return vertex
    }
    
    public func addDirectedEdge(source: Vertex<Element>, destination: Vertex<Element>, weight: Double?) {
        weights[source.index][destination.index] = weight // O(1)
    }
    
    public func edges(from source: Vertex<Element>) -> [Edge<Element>] {
        var edges = [Edge<Element>]()
        for (index, weight) in weights[source.index].enumerated() {
            guard let w = weight else {
                continue
            }
            edges.append(Edge(source: source, destination: vertices[index], weight: w))
        }
        return edges
    }
    
    public func weight(from source: Vertex<Element>, destination: Vertex<Element>) -> Double? {
        weights[source.index][destination.index]
    }
}
