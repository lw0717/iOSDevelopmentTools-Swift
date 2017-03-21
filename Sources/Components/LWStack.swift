//
//  LWStack.swift
//  iOSDevelopmentTools
//
//  Created by lw0717 on 17/3/13.
//  Copyright © 2017年 lw0717. All rights reserved.
//

import Foundation

public struct Stack<Element> {
    private var stack: Array<Element>
    init() {
        stack = []
    }
    public var size: Int {
        return stack.count
    }
    public var isEmpty: Bool {
        return stack.isEmpty
    }
    public mutating func push(_ element: Element) {
        stack.append(element)
    }
    public mutating func pop() -> Element? {
        //return stack.popLast()
        if self.isEmpty {
            return nil
        }else {
            return stack.removeLast()
        }
    }
    public func peek() -> Element? {
        return stack.last
    }
}
