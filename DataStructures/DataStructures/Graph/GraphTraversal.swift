//
//  GraphTraversal.swift
//  DataStructures
//
//  Created by Ankur Prakash on 01/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation

public protocol GraphTraversal {
    associatedtype Element
    func breathFirstSearch(from source: Vertex<Element>) -> [Vertex<Element>]
    func depthFirstSearch(from  source: Vertex<Element>) -> [Vertex<Element>]
}

public protocol GraphQuery {
    associatedtype Element: Hashable
    func neighboursOfAllVertices() -> [Vertex<Element>: [Vertex<Element>]]
    func allUniqueEdgesOfUndirectedGraph() -> [Edge<Element>]
    func allEdgesOfWeightedGraphSortedByWeight() -> [Edge<Element>]
    func allPaths(from source: Vertex<Element>, to destination: Vertex<Element>) -> [[Edge<Element>]]
    func longestPathInWeightedGraph() -> [Edge<Element>]
    func anyTwoNodesWithHighestNoOfVertices() -> [Edge<Element>]
    func nodesWhichAreSeperatedBySingleVertex() -> [[Vertex<Element>]]
    func longestDistanceInWeightedGraph() -> [Edge<Element>]
    func nodesWith(kNeighbours: Int) -> [Vertex<Element>]
    func nodesWithLeastNeighbours() -> [Vertex<Element>]
}
