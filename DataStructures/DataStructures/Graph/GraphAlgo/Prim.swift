//
//  Prim.swift
//  DataStructures
//
//  Created by Ankur Prakash on 11/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation

/// To Find Minimim spanning tree (subgraph with all vertices connected with no cycle). In other words,
/// find minimum subGraph which is a tree.
/// Can be performed in undirected graph
/// - Returns: Tuple (mst:<>, cost: Double)

public class Prim<Element: Hashable> {
    
    static func generateMST(_ graph: AdjacencyList<Element>) -> (mst: AdjacencyList<Element>, cost: Double) {
        let mst = AdjacencyList<Element>()
        mst.copyVertices(graph: graph)
        var cost = 0.0
        // now add the minimum edges
        var minPriorityQueue = PriorityQueue<Edge<Element>> {
            $0.weight ?? 0.0 < $1.weight ?? 0.0
        }
        guard let start = mst.vertices.first else {
            return (mst: mst, cost: cost)
        }
        var visited = Set<Vertex<Element>>() // once visited don't visit again
        graph.edges(from: start).forEach {
            minPriorityQueue.enqueue($0)
        }
        visited.insert(start)
        while let smallestEdge = minPriorityQueue.dequeue() {
            guard !visited.contains(smallestEdge.destination) else {
                continue // once visit don't go to that edge
            }
            mst.add(.undirected, source: smallestEdge.source, destination: smallestEdge.destination, weight: smallestEdge.weight)
            visited.insert(smallestEdge.destination)
            cost += smallestEdge.weight ?? 0.0
            graph.edges(from: smallestEdge.destination).forEach {
                if !visited.contains($0.destination) {
                    minPriorityQueue.enqueue($0)
                }
            }
        }
        return (mst: mst, cost: cost)
    }
}

extension Edge: Equatable where Element: Equatable {
    public static func == (lhs: Edge, rhs: Edge) -> Bool {
        lhs.source == rhs.source && lhs.destination == rhs.destination && lhs.weight == rhs.weight
    }
}
