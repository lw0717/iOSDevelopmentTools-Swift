//
//  UIColorExtension.swift
//  LWiOSDevelopmentTools
//
//  Created by lw0717 on 16/12/30.
//  Copyright © 2016年 lw0717. All rights reserved.
//

import UIKit

extension UIColor {
    // 自定义十六进制的颜色生成办法
    // 添加UIColor的扩展用于使用十六进制数值来生成颜色值
    public class func color(_ rgbColor: UInt32) -> UIColor {
        return color(rgbColor, alpha: 1.0)
    }
    
    public class func color(_ rgbColor: UInt32, alpha: Float) -> UIColor {
        // Hexadecimal color generation method
        // rgb: UInt32 = 0xCC6699
        let redComponent: UInt32 = (rgbColor & 0xFF0000) >> 16
        let greenComponent: UInt32 = (rgbColor & 0x00FF00) >> 8
        let blueComponent: UInt32 = (rgbColor & 0x0000FF)
        return UIColor.init(colorLiteralRed: Float(redComponent) / 255.0, green: Float(greenComponent) / 255.0, blue: Float(blueComponent) / 255.0, alpha: alpha)
    }
}
