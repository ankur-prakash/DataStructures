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
    
    public typealias VertexToEdgeMap = [Vertex<Element>:EdgeVisited<Element>]
    public enum EdgeVisited<Element> {
        case start
        case edge(Edge<Element>)
    }
    
    /// private(set) can't be applied on let properties as let makes properties immutable and that was causing issues.
    private(set) var graph: AdjacencyList<Element>
    public init(graph: AdjacencyList<Element>) {
        self.graph = graph // get ref as graph is a class
    }
    
    public func path(to destination: Vertex<Element>, paths: VertexToEdgeMap) -> [Edge<Element>] {
    
        var path = [Edge<Element>]()
        var next = destination
        while let edgeVisited = paths[next], case .edge(let pEdge) = edgeVisited {
            path = [pEdge] + path
            next = pEdge.source
        }
        return path
    }
    
    public func distance(to destination: Vertex<Element>, paths: VertexToEdgeMap) -> Double {
        path(to: destination, paths: paths).compactMap { $0.weight }.reduce(0.0, +)
    }
    
    public func shortestPath(from source: Vertex<Element>, to destination: Vertex<Element>) -> [Edge<Element>] {
        let vertexToEdgeMap = _prepareMap(from: source)
        return path(to: destination, paths: vertexToEdgeMap)
    }
    
    private func _prepareMap(from source: Vertex<Element>) -> VertexToEdgeMap {
        var vertexToPrefferedEdgeMap = VertexToEdgeMap()
        var visited = Set<Vertex<Element>>()
        var minPriorityQueue = PriorityQueue<Vertex<Element>> { vertex1, vertex2 in
            // we need to measure their distance from the source
            return self.distance(to: vertex1, paths: vertexToPrefferedEdgeMap) < self.distance(to: vertex2, paths: vertexToPrefferedEdgeMap)
        }
        vertexToPrefferedEdgeMap[source] = .start
        visited.insert(source)
        minPriorityQueue.enqueue(source)
        while let nextVertex = minPriorityQueue.dequeue() {
            graph.edges(from: nextVertex).forEach {
                guard let weight = $0.weight else {
                    return
                }
                let destination = $0.destination
                if vertexToPrefferedEdgeMap[destination] == nil || distance(to: $0.source, paths: vertexToPrefferedEdgeMap) + weight < distance(to: destination, paths: vertexToPrefferedEdgeMap) {
                    // relax the edge
                    vertexToPrefferedEdgeMap[destination] = .edge($0)
                }
            }
        }
        return vertexToPrefferedEdgeMap
    }
}
