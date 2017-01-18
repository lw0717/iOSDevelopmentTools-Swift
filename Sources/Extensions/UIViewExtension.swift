//
//  UIViewExtension.swift
//  LWiOSDevelopmentTools
//
//  Created by lw0717 on 17/1/6.
//  Copyright © 2017年 lw0717. All rights reserved.
//

import UIKit

extension UIView {
    // 添加UIView扩展用于获取UIView所在的UIViewController
    // 获取view所在的viewController
    public func inTheController() -> UIViewController? {
        var next = self.next
        repeat {
            if let controller = next as? UIViewController {
                return controller
            }else if let view = next as? UIView {
                next = view.next
            }else if let nextResponder = next {
                next = nextResponder.next
            }else {
                return nil
            }
        }while next != nil
        return nil
    }
}
