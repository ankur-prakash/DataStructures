//
//  TreeCentre.swift
//  DataStructures
//
//  Created by Ankur Prakash on 11/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation

class TreeCentre<Element: Hashable> {
    
    class func findCentre(_ graph: AdjacencyList<Element>) -> [Vertex<Element>] {

        typealias VertexId = Int
        var degree = [VertexId: Int]()
        var leaves = [Vertex<Element>]()
        graph.vertices.forEach {
            //find leaves
            let nodeDegree = graph.adjacencies[$0]!.count
            degree[$0.index] = nodeDegree
            if nodeDegree ==  1 || nodeDegree ==  0 {
                leaves.append($0)
                degree[$0.index] = 0
            }
        }
        var processCount = leaves.count
        while processCount < graph.vertices.count {
            var newLeaves = [Vertex<Element>]()
            for vertex in leaves {
                let neighbours = graph.edges(from: vertex).map { $0.destination }
                for neigh in neighbours {
                    degree[neigh.index] = degree[neigh.index]! - 1
                    if degree[neigh.index] == 1 {
                        newLeaves.append(neigh)
                        degree[neigh.index] = 0
                    }
                }
            }
            processCount += newLeaves.count
            leaves = newLeaves
        }
        return leaves
    }
}
