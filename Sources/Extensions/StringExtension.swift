//
//  StringExtension.swift
//  iOSDevelopmentTools
//
//  Created by lw0717 on 17/3/16.
//  Copyright © 2017年 lw0717. All rights reserved.
//

import Foundation

extension String {
    func chinesePhoneticAlphabet() -> String {
        var pinyin = ""
        if self == "" {
            return pinyin
        }
        let str = CFStringCreateMutableCopy(nil, 0, self as CFString)
        CFStringTransform(str, nil, kCFStringTransformToLatin, Bool(0))
        CFStringTransform(str, nil, kCFStringTransformStripCombiningMarks, Bool(0))
        
        if let str = str {
            pinyin = str as String
        }
        return pinyin
    }
}
