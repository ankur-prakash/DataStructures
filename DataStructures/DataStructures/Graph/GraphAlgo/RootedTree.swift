//
//  RootedTree.swift
//  DataStructures
//
//  Created by Ankur Prakash on 11/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation

public class TreeNode<Element> {

    public var value: Element
    public var children: [TreeNode<Element>]
    public weak var parent: TreeNode<Element>?
    
    public init(_ value: Element, children: [TreeNode<Element>]=[], parent: TreeNode<Element>? = nil) {
        self.value = value
        self.children = children
        self.parent = parent
    }
}

extension TreeNode: CustomStringConvertible {
    public var description: String {
        "\(String(describing: self.value)) -> \(self.children)"
    }
}

/// Rooted tree using DFS
public class RootedTree<Element: Hashable> {
    
    class func rootedTree(_ graph: AdjacencyList<Element>) -> TreeNode<Element>? {
        guard let start = graph.vertices.first else {
            return nil
        }
        let root = TreeNode(start.data)
        var stack = StackADT<Vertex<Element>>()
        var visited = Set<Vertex<Element>>()
        visited.insert(start)
        var next = start
        var previousNode: TreeNode<Element>? = root
        while true {
            if let nextVertex = graph.edges(from: next).first(where: { !visited.contains($0.destination)})?.destination {
                let newNode = TreeNode(nextVertex.data, parent: previousNode)
                previousNode?.children.append(newNode)
                visited.insert(nextVertex)
                stack.push(nextVertex)
                previousNode = newNode
                next = nextVertex
            } else if let oldVertex = stack.pop() {
                next = oldVertex
                previousNode =  previousNode?.parent
            } else {
                break
            }
        }
        return root
    }
}
