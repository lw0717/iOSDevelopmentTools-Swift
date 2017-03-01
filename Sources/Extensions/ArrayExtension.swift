//
//  ArrayExtension.swift
//  iOSDevelopmentTools
//
//  Created by lw0717 on 17/3/1.
//  Copyright © 2017年 lw0717. All rights reserved.
//

import Foundation

extension Array {
    public func index<T: Equatable>(_ obj: T) -> Index? {
        return self.index(where: { $0 as? T == obj })
    }
    
    public mutating func remove<T: Equatable>(_ obj: T) -> Bool {
        if let index = index(obj) {
            _ = self.remove(at: index)
            return true
        }
        return false
    }
}
