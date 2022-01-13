//
//  GraphTraversal.swift
//  DataStructures
//
//  Created by Ankur Prakash on 01/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation

public func breathFirstSearch<Element: Hashable>(from source: Vertex<Element>, graph: AdjacencyList<Element>) -> [Vertex<Element>] {

    var queue = QueueADT<Vertex<Element>>()
    var visited = [Vertex<Element>]() // to maintain the order
    visited.append(source)
    queue.enqueue(source)
    var pushed = Set<Vertex<Element>>()
    pushed.insert(source)

    while let vertex = queue.dequeue() {
        graph.edges(from: vertex).forEach {
            if !pushed.contains($0.destination) {
                queue.enqueue($0.destination)
                pushed.insert($0.destination)
                visited.append($0.destination)
            }
        }
    }
    return visited
}

func depthFirstSearch<Element: Hashable>(from  source: Vertex<Element>,
                                         graph: AdjacencyList<Element>) -> [Vertex<Element>] {
    var stack = StackADT<Vertex<Element>>()
    var visited = [Vertex<Element>]()
    var pushed = Set<Vertex<Element>>()
    var next = source
    while true {
        if let nextVertex = graph.edges(from: next).first(where: { !pushed.contains($0.destination) })?.destination {
            visited.append(nextVertex)
            pushed.insert(nextVertex)
            stack.push(nextVertex)
            next = nextVertex
        } else if let oldVertex = stack.pop() {
            next = oldVertex
        } else {
            break
        }
    }
    return visited
}

public func breathFirstSearch<Element: Hashable>(from source: Vertex<Element>, graph: AdjacencyMatrix<Element>) -> [Vertex<Element>] {

    var queue = QueueADT<Vertex<Element>>()
    var visited = [Vertex<Element>]() // to maintain the order
    visited.append(source)
    queue.enqueue(source)
    var pushed = Set<Vertex<Element>>()
    pushed.insert(source)

    while let vertex = queue.dequeue() {
        graph.edges(from: vertex).forEach {
            if !pushed.contains($0.destination) {
                queue.enqueue($0.destination)
                pushed.insert($0.destination)
                visited.append($0.destination)
            }
        }
    }
    return visited
}

func depthFirstSearch<Element: Hashable>(from  source: Vertex<Element>,
                                         graph: AdjacencyMatrix<Element>) -> [Vertex<Element>] {
    var stack = StackADT<Vertex<Element>>()
    var visited = [Vertex<Element>]()
    var pushed = Set<Vertex<Element>>()
    var next = source
    while true {
        if let nextVertex = graph.edges(from: next).first(where: { !pushed.contains($0.destination) })?.destination {
            visited.append(nextVertex)
            pushed.insert(nextVertex)
            stack.push(nextVertex)
            next = nextVertex
        } else if let oldVertex = stack.pop() {
            next = oldVertex
        } else {
            break
        }
    }
    return visited
}

public protocol GraphQuery {
    associatedtype Element: Hashable
    ///- Complexity: O(VE)
    func neighboursOfAllVertices() -> [Vertex<Element>: [Vertex<Element>]]
    /// for Weighted Graph
    func allUniqueEdgesOfUndirectedGraph() -> [Edge<Element>]
    func allEdgesOfWeightedGraphSortedByWeight() -> [Edge<Element>]
    func allPaths(from source: Vertex<Element>, to destination: Vertex<Element>) -> [[Edge<Element>]]
//    func longestPathInWeightedGraph() -> [Edge<Element>]
    func anyTwoNodesWithHighestNoOfVerticesBetweenThem() -> [Edge<Element>]
    func nodesWhichAreSeperatedBySingleVertex() -> [[Vertex<Element>]]
    func longestDistanceInWeightedGraph() -> [Edge<Element>]
    func nodesWith(kNeighbours: Int) -> [Vertex<Element>]
    func nodesWithLeastNeighbours() -> [Vertex<Element>]
}
