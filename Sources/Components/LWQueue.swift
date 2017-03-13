//
//  LWQueue.swift
//  iOSDevelopmentTools
//
//  Created by lw0717 on 17/3/13.
//  Copyright © 2017年 lw0717. All rights reserved.
//

import Foundation

public struct LWQueue<Element> {
    private var queue: Array<Element>
    init() {
        queue = []
    }
    public mutating func enqueue(_ element: Element) {
        queue.append(element)
    }
    public mutating func dequeue() -> Element? {
        //return stack.popLast()
        if isEmpty() {
            return nil
        }else {
            return queue.removeFirst()
        }
    }
    public func isEmpty() -> Bool {
        return queue.isEmpty
    }
    public func peek() -> Element? {
        return queue.first
    }
    public func size() -> Int {
        return queue.count
    }
}
