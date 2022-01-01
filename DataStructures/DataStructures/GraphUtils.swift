//
//  Utils.swift
//  DataStructures
//
//  Created by Ankur Prakash on 01/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation

public enum GraphAttribute {
    
    public enum FormationType {
        case list
        case matrix
    }
    public enum WeightValueType {
        case onlyNegative
        case onlyPositive
        case mixed
    }
    
    public enum EdgeWeight {
       case weighted
       case unweighted
   }
    
    public enum VertexConnectivity {
        case connected
        case disconnected
    }
    
    public enum EdgeConnectionType {
        case cyclic
        case acyclic
    }
    
    public enum EdgeDirection {
        case directed
        case undirected
    }
}

public final class GraphUtils {
   
    public typealias GraphADT = AdjacencyList<String>
    
    static func buildGraph(weightType: GraphAttribute.EdgeWeight = .unweighted,
                           vertexConnection: GraphAttribute.VertexConnectivity = .connected,
                           edgeConnectionType: GraphAttribute.EdgeConnectionType = .acyclic,
                           direction: GraphAttribute.EdgeDirection = .undirected, weightValueType: GraphAttribute.WeightValueType = .onlyPositive, formationType: GraphAttribute.FormationType) {
        
        switch (weightType, vertexConnection, edgeConnectionType, direction, weightValueType) {
        case (.unweighted, .connected, .acyclic, .undirected, .onlyPositive):
            break
        default:
            break
        }
        
    }
    
    //MARK: Acyclic
    static func buildSimpleUndiretedUnweightedGraph() -> GraphADT {
        
        let graph = GraphADT()
        var vertexMap = [String: Vertex<String>]()
        ["A", "B", "C", "D","E", "F", "G", "H"].forEach {
            vertexMap[$0] =  graph.createVertex($0)
        }
        graph.add(.undirected, source: vertexMap["A"]!, destination: vertexMap["B"]!, weight: nil)
        graph.add(.undirected, source: vertexMap["B"]!, destination: vertexMap["C"]!, weight: nil)
        graph.add(.undirected, source: vertexMap["C"]!, destination: vertexMap["D"]!, weight: nil)
        graph.add(.undirected, source: vertexMap["D"]!, destination: vertexMap["A"]!, weight: nil)
        graph.add(.undirected, source: vertexMap["A"]!, destination: vertexMap["H"]!, weight: nil)
        graph.add(.undirected, source: vertexMap["B"]!, destination: vertexMap["G"]!, weight: nil)
        graph.add(.undirected, source: vertexMap["C"]!, destination: vertexMap["F"]!, weight: nil)
        graph.add(.undirected, source: vertexMap["C"]!, destination: vertexMap["E"]!, weight: nil)
        return graph
    }
    
    static func buildSimpleUndiretedWeightedGraph() -> GraphADT {
        
        let graph = GraphADT()
        var vertexMap = [String: Vertex<String>]()
        ["A", "B", "C", "D","E", "F", "G", "H"].forEach {
            vertexMap[$0] =  graph.createVertex($0)
        }
        graph.add(.undirected, source: vertexMap["A"]!, destination: vertexMap["B"]!, weight: 200)
        graph.add(.undirected, source: vertexMap["B"]!, destination: vertexMap["C"]!, weight: 100)
        graph.add(.undirected, source: vertexMap["C"]!, destination: vertexMap["D"]!, weight: 30.0)
        graph.add(.undirected, source: vertexMap["D"]!, destination: vertexMap["A"]!, weight: 80.0)
        graph.add(.undirected, source: vertexMap["A"]!, destination: vertexMap["H"]!, weight: 90.0)
        graph.add(.undirected, source: vertexMap["B"]!, destination: vertexMap["G"]!, weight: 9.0)
        graph.add(.undirected, source: vertexMap["C"]!, destination: vertexMap["F"]!, weight: 62.0)
        graph.add(.undirected, source: vertexMap["C"]!, destination: vertexMap["E"]!, weight: 55.0)
        return graph
    }
    
    static func buildSimpleDirectedWeightedGraph() -> GraphADT {
        let graph = GraphADT()
        var vertexMap = [String: Vertex<String>]()
        ["A", "B", "C", "D","E", "F", "G", "H"].forEach {
            vertexMap[$0] =  graph.createVertex($0)
        }
        graph.add(.directed, source: vertexMap["A"]!, destination: vertexMap["B"]!, weight: 200)
        graph.add(.directed, source: vertexMap["B"]!, destination: vertexMap["C"]!, weight: 100)
        graph.add(.directed, source: vertexMap["C"]!, destination: vertexMap["D"]!, weight: 30.0)
        graph.add(.directed, source: vertexMap["D"]!, destination: vertexMap["A"]!, weight: 80.0)
        graph.add(.directed, source: vertexMap["A"]!, destination: vertexMap["H"]!, weight: 90.0)
        graph.add(.directed, source: vertexMap["B"]!, destination: vertexMap["G"]!, weight: 9.0)
        graph.add(.directed, source: vertexMap["C"]!, destination: vertexMap["F"]!, weight: 62.0)
        graph.add(.directed, source: vertexMap["C"]!, destination: vertexMap["E"]!, weight: 55.0)
        return graph
    }
    
    static func buildSimpleDirectedUnWeightedGraph() -> GraphADT {
        
        let graph = GraphADT()
        var vertexMap = [String: Vertex<String>]()
        ["A", "B", "C", "D","E", "F", "G", "H"].forEach {
            vertexMap[$0] =  graph.createVertex($0)
        }
        graph.add(.directed, source: vertexMap["A"]!, destination: vertexMap["B"]!, weight: nil)
        graph.add(.directed, source: vertexMap["B"]!, destination: vertexMap["C"]!, weight: nil)
        graph.add(.directed, source: vertexMap["C"]!, destination: vertexMap["D"]!, weight: nil)
        graph.add(.directed, source: vertexMap["D"]!, destination: vertexMap["A"]!, weight: nil)
        graph.add(.directed, source: vertexMap["A"]!, destination: vertexMap["H"]!, weight: nil)
        graph.add(.directed, source: vertexMap["B"]!, destination: vertexMap["G"]!, weight: nil)
        graph.add(.directed, source: vertexMap["C"]!, destination: vertexMap["F"]!, weight: nil)
        graph.add(.directed, source: vertexMap["C"]!, destination: vertexMap["E"]!, weight: nil)
        return graph
    }
    
}

