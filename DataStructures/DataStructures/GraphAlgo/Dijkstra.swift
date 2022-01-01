//
//  Dijkstra.swift
//  DataStructures
//
//  Created by Ankur Prakash on 01/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation

/// Dijkstra Algo approach:
/// 1. Prepare [Vertex: PrefferedEdge] for the source to each vertex
/// Actually algo is based on the fact that node which has shortest path from the source should be picked first
/// In order to pick sorted path from the source first, we will use min heap

public class Dijkstra<Element: Hashable> {
    
    /// private(set) can't be applied on let properties as let makes properties immutable and that was causing issues.
    private(set) var graph: AdjacencyList<String>
    public init(graph: AdjacencyList<String>) {
        self.graph = graph
    }
    
    public func shortestPath(from source: Vertex<Element>, to destination: Vertex<Element>) -> [Edge<Element>] {
        return []
    }
}
