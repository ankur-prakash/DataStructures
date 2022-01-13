//
//  AdjacencyList.swift
//  DataStructures
//
//  Created by Ankur Prakash on 11/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation

public class AdjacencyList<Element: Hashable> {
    /// Adjacency List contains Hash of V: [E]
    private(set) var adjacencies = [Vertex<Element>: [Edge<Element>]]()
    
    public init() {}
    public var vertices: [Vertex<Element>] { Array(adjacencies.keys) }
}

extension AdjacencyList: Graph {
    
    public func createVertex(_ data: Element) -> Vertex<Element> {
        let vertex = Vertex(index: adjacencies.count, data: data)
        adjacencies[vertex] = []
        return vertex
    }
    
    public func addDirectedEdge(source: Vertex<Element>, destination: Vertex<Element>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencies[source]!.append(edge)
    }
    
    public func edges(from source: Vertex<Element>) -> [Edge<Element>] {
        adjacencies[source] ?? []
    }
    
    public func weight(from source: Vertex<Element>, destination: Vertex<Element>) -> Double? {
        edges(from: source).filter { $0.destination ==  destination }.first?.weight
    }
}

extension AdjacencyList where Element: Hashable {
    
    func copyVertices(graph: AdjacencyList<Element>) {
        graph.vertices.forEach {
            adjacencies[$0] = []
        }
    }
}

extension AdjacencyList: CustomStringConvertible {
    public var description: String {
        "\(adjacencies)"
    }
}
