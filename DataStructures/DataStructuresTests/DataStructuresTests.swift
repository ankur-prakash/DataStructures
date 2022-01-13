//
//  DataStructuresTests.swift
//  DataStructuresTests
//
//  Created by Ankur Prakash on 30/04/20.
//  Copyright © 2020 Ankur Prakash. All rights reserved.
//

import XCTest
@testable import DataStructures

class DataStructuresTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testMatrix() {
        let list = GraphUtils.buildSimpleUndiretedWeightedGraph()
        list.vertices.forEach {
            print("Edges for \($0.data) =>", list.edges(from: $0))
        }
        
        let matrix = GraphUtils.specialbuildSimpleUndiretedWeightedGraph()
        matrix.vertices.forEach {
            print("Edges for \($0.data) =>", matrix.edges(from: $0))
        }
//        print(breathFirstSearch(from: list.vertices[0], graph: list))
//        print(depthFirstSearch(from: list.vertices[0], graph: list))
//        print(depthFirstSearch(from: list.vertices[0], graph: matrix))
//        let a = list.vertices.first(where: {$0.data == "A" })!
//        let f = list.vertices.first(where: {$0.data == "F" })!
//        print("Dijkstra = ", Dijkstra(list).shortestRoute(from: a, destination: f))
//        print("prim = ", Prim.generateMST(list))
        let root = RootedTree.rootedTree(list)
        
        print("Rooted tree = \(TreeCentre.findCentre(list))")
    }
    
    func testCentreOfTheTree() {
       let graph =  GraphUtils.buildStarWeightedGraph()
        print("Rooted tree = \(TreeCentre.findCentre(graph))")
    }
    
    func testheap() {
        var heap = Heap(>, elements: [-2,9,1,-10,3,11,14,17,3])
        print(heap._elements)
        while let element =  heap.remove() {
            print(element)
        }
    }
    
    func testPrimAlgo() {
//        let graph = GraphUtils.buildSimpleUndiretedWeightedGraph()
//        print("LEAST: \(graph.nodesWithLeastNeighbours())")
//        let args = Prim.getMinimumSpanningTree(for: graph)
//        print("args = \(args.cost)")
//        print(args.mst)
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

//    func giveMeGraph<T: Hashable>(type: Bool) -> AnyGraph<T> {
//        if type {
//            return AnyGraph(AdjacencyList<T>())
//        }
//        return AnyGraph(AdjacencyMatrix<T>())
//    }
}
