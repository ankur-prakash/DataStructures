//
//  AdjacencyList.swift
//  DataStructures
//
//  Created by Ankur Prakash on 01/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation

public class AdjacencyList<Element: Hashable> {

    private(set) var adjacencies = [Vertex<Element>: [Edge<Element>]]()
    public init() {}
}

extension AdjacencyList: Graph {
    
    public func createVertex(_ data: Element) -> Vertex<Element> {
        let vertex = Vertex(index: adjacencies.count, data: data)
        adjacencies[vertex] = []
        return vertex
    }
    
    public func addDirectedEdge(source: Vertex<Element>, destination: Vertex<Element>, weight: Double?) {
    
        guard adjacencies[source] != nil,
              adjacencies[destination] != nil else {
            return
        }
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencies[source]!.append(edge)
    }

    public func edges(from source: Vertex<Element>) -> [Edge<Element>] {
        adjacencies[source] ?? []
    }
    
    public func weight(from source: Vertex<Element>, destination: Vertex<Element>) -> Double? {
        adjacencies[source]?.first(where: { $0.destination == destination })?.weight
    }
}
