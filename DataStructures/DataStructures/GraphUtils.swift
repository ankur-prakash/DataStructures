//
//  Utils.swift
//  DataStructures
//
//  Created by Ankur Prakash on 01/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation

public enum GraphAttribute {
    
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
        case Acyclic
    }
    
    public enum EdgeDirection {
        case directed
        case undirected
    }
}

public final class GraphUtils {
   
    static func buildSimpleUnweightedGraph() {
        
    }
}

