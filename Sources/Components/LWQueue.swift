//
//  LWQueue.swift
//  iOSDevelopmentTools
//
//  Created by lw0717 on 17/3/13.
//  Copyright © 2017年 lw0717. All rights reserved.
//

import Foundation

public struct Queue<Element> {
    private var queue: Array<Element>
    init() {
        queue = []
    }
    public var size: Int {
        return queue.count
    }
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    public mutating func enqueue(_ element: Element) {
        queue.append(element)
    }
    public mutating func dequeue() -> Element? {
        //return queue.dropFirst()
        if self.isEmpty {
            return nil
        }else {
            return queue.removeFirst()
        }
    }
    public func peek() -> Element? {
        return queue.first
    }
}
