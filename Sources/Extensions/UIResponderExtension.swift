//
//  UIResponderExtension.swift
//  LWiOSDevelopmentTools
//
//  Created by lw0717 on 17/1/4.
//  Copyright © 2017年 lw0717. All rights reserved.
//

import UIKit

private weak var currentFirstResponder: AnyObject?

extension UIResponder {
    // 获取第一响应者的办法 
    // 添加UIResponder的扩展用于获取第一响应者（当存在第一响应者）
    public class func firstResponder() -> AnyObject? {
        currentFirstResponder = nil
        // 通过将target设置为nil，让系统自动遍历响应链
        // 从而响应链当前第一响应者响应我们自定义的方法
        UIApplication.shared.sendAction(#selector(findFirstResponder(_:)), to: nil, from: nil, for: nil)
        return currentFirstResponder
    }
    
    // let firstResponder = UIResponder.firstResponder()
    @objc private func findFirstResponder(_ sender: AnyObject) {
        // 第一响应者会响应这个方法，并且将静态变量currentFirstResponder设置为自己
        currentFirstResponder = self
    }
}
