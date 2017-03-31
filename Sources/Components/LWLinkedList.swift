//
//  LWLinkedList.swift
//  iOSDevelopmentTools
//
//  Created by lw0717 on 17/3/21.
//  Copyright © 2017年 lw0717. All rights reserved.
//

import Foundation

public struct LinkedList<Element: Equatable> {
    public typealias Index = Int
    private var linkedList: Array<Element>
    init() {
        linkedList = []
    }
    public var length: Int {
        return linkedList.count
    }
    public var isEmpty: Bool {
        return linkedList.isEmpty
    }
    private func checkIndex(_ index: Index) -> Bool {
        if index > 0 && index < self.length {
            return true
        }else {
            return false
        }
    }
    public mutating func append(_ element: Element) {
        linkedList.append(element)
    }
    public func fetch(_ element: Element) -> Index? {
        return linkedList.index(of: element)
    }
    public mutating func modify(_ newElement: Element, at index: Index) -> Element? {
        if checkIndex(index) {
            let oldElement = linkedList[index]
            linkedList[index] = newElement
            return oldElement
        }else {
            return nil
        }
    }
    public mutating func insert(_ element: Element, at index: Index) -> Bool {
        if checkIndex(index) {
            linkedList.insert(element, at: index)
            return true
        }else {
            return false
        }
    }
    public mutating func remove(at index: Int) -> Element? {
        if checkIndex(index) {
            return linkedList.remove(at: index)
        }else {
            return nil
        }
    }
    public mutating func removeLast() -> Element? {
        return linkedList.removeLast()
    }
}
