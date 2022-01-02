//
//  Prim.swift
//  DataStructures
//
//  Created by Ankur Prakash on 01/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation

/// Prim Algo is for Minimum Spanning tree for undirected graph
///
/// Summary: Spanning tree is: all vertices connected, no cycles, few edges
/// Lowest Edge + DFS travesal => DFS giving priority to lowest Edge
/// Edge must be equatable
///
///    ````
///     Egde: Equatable & Hashable
///    ````

public class Prim<Element: Equatable & Hashable> {
    
    public static func getMinimumSpanningTree(for graph: AdjacencyList<Element>)
    -> (mst: AdjacencyList<Element>, cost: Double) {
        var cost = 0.0
        let mst = AdjacencyList<Element>()
        var minEdgePriorityQueue = PriorityQueue<Edge<Element>> {
            $0.weight ?? 0.0 < $1.weight ?? 0.0
        }
        var visited = Set<Vertex<Element>>()
        guard let start = graph.adjacencies.keys.first else {
            return (mst: mst, cost: cost)
        }
        mst.copyVertices(graph: graph)
        graph.edges(from: start).forEach {
            minEdgePriorityQueue.enqueue($0)
        }
        visited.insert(start)
        while let smallestEdge = minEdgePriorityQueue.dequeue() {
            let destination = smallestEdge.destination
            // if smallestEdge.weight is nil then what to do?
            guard !visited.contains(destination) else {
                continue //destination is already visited
            }
            mst.addUndirectedEdge(source: smallestEdge.source,
                                  destination: smallestEdge.destination,
                                  weight: smallestEdge.weight)
            cost += smallestEdge.weight ?? 0.0
            visited.insert(destination)
            graph.edges(from: destination).forEach {
                if !visited.contains($0.destination) {
                    minEdgePriorityQueue.enqueue($0)
                }
            }
        }
        return (mst: mst, cost: cost)
    }
}

extension Edge: Equatable where Element:Equatable {
    public static func == (lhs: Edge, rhs: Edge) -> Bool {
        lhs.source == rhs.source && lhs.destination == rhs.destination && lhs.weight == rhs.weight
    }
}
