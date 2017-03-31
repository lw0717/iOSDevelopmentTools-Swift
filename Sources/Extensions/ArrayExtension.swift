//
//  ArrayExtension.swift
//  iOSDevelopmentTools
//
//  Created by lw0717 on 17/3/1.
//  Copyright © 2017年 lw0717. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    public func index(_ obj: Element) -> Index? {
        return self.index(where: { $0 == obj })
    }
    
    public func contains(_ objs: [Element]) -> Bool {
        guard objs.count <= self.count else {
            return false
        }
        var isTreated: Bool = false
        for obj in objs {
            if self.contains(where: { $0 == obj }) {
                isTreated = true
            }
        }
        return isTreated
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
            return true
        }
        var isTreated: Bool = false
        for obj in objs {
            if self.remove(obj) {
                isTreated = true
            }
        }
        return isTreated
    }
}
