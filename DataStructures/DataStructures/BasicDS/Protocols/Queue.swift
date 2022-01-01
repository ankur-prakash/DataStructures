//
//  Queue.swift
//  DataStructures
//
//  Created by Ankur Prakash on 01/01/22.
//  Copyright © 2022 Ankur Prakash. All rights reserved.
//

import Foundation
/*
 insertFront(): Adds an item at the front of Deque.
 insertLast(): Adds an item at the rear of Deque.
 deleteFront(): Deletes an item from front of Deque.
 deleteLast(): Deletes an item from rear of Deque.

 In addition to above operations, following operations are also supported
 getFront(): Gets the front item from queue.
 getRear(): Gets the last item from queue.
 isEmpty(): Checks whether Deque is empty or not.
 isFull(): Checks whether Deque is full or not
 
 */

public protocol Queue {
   
    associatedtype Element
    mutating func enqueue(_ value: Element)
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

public protocol Deque: Queue {
    
    mutating func insertFront(_ value: Element)
    mutating func removeRear() -> Element?
}
