//
//  LWStack.swift
//  iOSDevelopmentTools
//
//  Created by lw0717 on 17/3/13.
//  Copyright © 2017年 lw0717. All rights reserved.
//

import Foundation

public struct LWStack<Element> {
    private var stack: Array<Element>
    init() {
        stack = []
    }
    public mutating func push(_ element: Element) {
        stack.append(element)
    }
    public mutating func pop() -> Element? {
        //return stack.popLast()
        if isEmpty() {
            return nil
        }else {
            return stack.removeLast()
        }
    }
    public func isEmpty() -> Bool {
        return stack.isEmpty
    }
    public func peek() -> Element? {
        return stack.last
    }
    public func size() -> Int {
        return stack.count
    }
}
