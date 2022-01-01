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


extension AdjacencyList: GraphTraversal {
    
    public func breathFirstSearch(from source: Vertex<Element>) -> [Vertex<Element>] {
        typealias V = Vertex<Element>
        var visited = [V]()
        var queue = QueueADT<V>()
        var pushedToQueue = Set<V>()
        visited.append(source)
        queue.enqueue(source)
        pushedToQueue.insert(source)
        while let vertex = queue.dequeue() {
            edges(from: vertex).forEach {
                if !pushedToQueue.contains($0.destination) {
                    queue.enqueue($0.destination)
                    pushedToQueue.insert($0.destination)
                    visited.append($0.destination)
                }
            }
        }
        return visited
    }
    
    public func depthFirstSearch(from source: Vertex<Element>) -> [Vertex<Element>] {
        typealias V = Vertex<Element>
        var pushedToStack = Set<V>()
        var stack = StackADT<V>()
        var visited = [V]()
        stack.push(source)
        visited.append(source)
        pushedToStack.insert(source)
        var next = source
        while true {
            if let nextVertex = edges(from: next).first(where: { !pushedToStack.contains($0.destination) })?.destination {
                stack.push(nextVertex)
                visited.append(nextVertex)
                pushedToStack.insert(nextVertex)
                next = nextVertex
            } else if let popVertex = stack.pop() {
                next = popVertex
            } else {
                break
            }
        }
        return visited
    }
}
