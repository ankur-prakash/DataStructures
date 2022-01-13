//
//  Dijkstra.swift
//  DataStructures
//
//  Created by Ankur Prakash on 11/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation

public enum EdgeVisited<Element> {
    case start
    case edge(Edge<Element>)
}

/// This is to get the shortest path for non-negative weight
public class Dijkstra<Element: Hashable> {
  
    public typealias Graph = AdjacencyList<Element>
    public let graph: Graph
    public init(_ graph: Graph) {
        self.graph = graph
    }
    
    /// Logic of Dijkstra is
    /// 1. Prepare Hash for Vertex: PrefferedEdge
    /// 2. Get the route from the destination to source
    func path(from destination: Vertex<Element>, hash: [Vertex<Element>: EdgeVisited<Element>]) -> [Edge<Element>] {
        var path = [Edge<Element>]()
        var next = destination
        while let edgeVisited = hash[next], case .edge(let edge ) = edgeVisited {
            path = [edge] + path
            next = edge.source
        }
        return path
    }
    
    func distance(from destination: Vertex<Element>,
                  hash: [Vertex<Element>: EdgeVisited<Element>]) -> Double {
        path(from: destination, hash: hash).compactMap { $0.weight }.reduce(0.0, +)
    }
    
    func shortestRoute(from source: Vertex<Element>, destination: Vertex<Element>) -> [Edge<Element>] {
            let hash = prepareHash(for: source)
            return path(from: destination, hash: hash)
    }
    func prepareHash(for source: Vertex<Element>) -> [Vertex<Element>: EdgeVisited<Element>] {
        ///
        var hash = [Vertex<Element>: EdgeVisited<Element>]()
        hash[source] = .start
        var priorityQueue = PriorityQueue<Vertex<Element>> {
            self.distance(from: $0, hash: hash) < self.distance(from: $1, hash: hash)
        }
        var visited = Set<Vertex<Element>>()
        priorityQueue.enqueue(source)
        while let next = priorityQueue.dequeue() {

            for edge in graph.edges(from: next) {
                if hash[edge.destination] == nil || distance(from: edge.source, hash: hash) + (edge.weight ?? 0.0) < distance(from: edge.destination, hash: hash) {
                    hash[edge.destination] = .edge(edge)
                    priorityQueue.enqueue(edge.destination)
                    visited.insert(edge.destination)
                }
            }
        }
        return hash
    }
}
