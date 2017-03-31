//
//  ArrayExtension.swift
//  iOSDevelopmentTools
//
//  Created by lw0717 on 17/3/1.
//  Copyright © 2017年 lw0717. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    // 该部分的几个方法，在array不含有重复元素的时候均成立，在含有重复元素的时候是否合理还需要验证
    public func index(_ obj: Element) -> Index? {
        return self.index(where: { $0 == obj })
    }
    
    public func contains(_ objs: [Element]) -> Bool {
        guard objs.count <= self.count else {
            return false
        }
        for obj in objs {
            if !self.contains(where: { $0 == obj }) {
                return false
            }
        }
        return true
    }
    
    public static func ==(lhs: Array, rhs: Array) -> Bool {
        guard lhs.count == rhs.count else {
            return false
        }
        return lhs.contains(rhs)
    }
    
    public mutating func remove(_ obj: Element) -> Bool {
        if let index = index(obj) {
            _ = self.remove(at: index)
            return true
        }
        return false
    }
    
    public mutating func remove(_ objs: [Element]) -> Bool {
        guard self.contains(objs) else {
            return false
        }
        if self.count == objs.count {
            self = []
            return true
        }
        self = self.filter { !objs.contains($0) }
        return true
    }
}
