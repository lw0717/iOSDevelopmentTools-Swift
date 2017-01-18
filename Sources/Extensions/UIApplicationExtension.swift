//
//  UIApplicationExtension.swift
//  LWiOSDevelopmentTools
//
//  Created by lw0717 on 17/1/7.
//  Copyright © 2017年 SMH. All rights reserved.
//

import UIKit

extension UIApplication {
    // 添加UIApplication的扩展用于获取展示在window最上层且为UIWindowLevelNormal的UIView所在的UIViewController
    // 获取展示在屏幕上最上层的View所在Controller
    func rootTopViewController() -> UIViewController? {
        var result: UIViewController
        var window = keyWindow
        if window?.windowLevel != UIWindowLevelNormal {
            for tmpWin in windows {
                if tmpWin.windowLevel == UIWindowLevelNormal {
                    window = tmpWin
                    break
                }
            }
        }
        if let rootVC = window?.rootViewController {
            var vc: UIViewController = rootVC
            while true {
                if let aaa = vc as? UITabBarController {
                    if let bbb = aaa.selectedViewController {
                        vc = bbb
                    }else {
                        break
                    }
                }else if let aaa = vc as? UINavigationController {
                    if let bbb = aaa.topViewController {
                        vc = bbb
                    }else {
                        break
                    }
                }else {
                    // 其他容器
                    break
                }
            }
            print(vc.self)
            result = vc
        }else {
            return nil
        }
        // A presentViewController B 后，a.presentedViewController就是b，b.presentingViewController就是a
//        if let vcTabBar = presentingViewController as? TabBarController {
//            for vcBase in vcTabBar.viewControllers! {
//                if let vcNav = vcBase as? NavigationController,
//                    let vc = vcNav.topViewController as? ChoosePeopleViewController {
//                    vc.chooseArray = self.chooseArray
//                }
//            }
//        }
        return result
    }
}
