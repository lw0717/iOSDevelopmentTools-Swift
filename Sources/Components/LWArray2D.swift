//
//  LWArray2D.swift
//  LWSudoku
//
//  Created by lw0717 on 17/2/10.
//  Copyright © 2017年 lw0717. All rights reserved.
//

import Foundation

public struct Array2D<T> {
    let rows: Int
    let columns: Int
    
    private var array: Array<T?>
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        array = Array<T?>(repeating: nil, count: rows * columns)
    }
    
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row <= rows && column >= 0 && column <= columns
    }
    
    subscript(row: Int, column: Int) -> T? {
        get {
            assert(indexIsValidForRow(row: row, column: column), "Index out of range")
            return array[(row * columns) + column]
        }
        set(newValue) {
            assert(indexIsValidForRow(row: row, column: column), "Index out of range")
            array[(row * columns) + column] = newValue
        }
    }
    
}
