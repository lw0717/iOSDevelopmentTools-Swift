//
//  UIImageExtension.swift
//  iOSDevelopmentTools
//
//  Created by lw0717 on 17/1/18.
//  Copyright © 2017年 lw0717. All rights reserved.
//

import UIKit

extension UIImage {
    /**
     *  重设图片大小 成功则返回新图片，失败则返回原图片
     */
    open func resize(_ resize: CGSize) -> UIImage {
        // 开启上下文
        UIGraphicsBeginImageContextWithOptions(resize, false, UIScreen.main.scale)
        self.draw(in: CGRect.init(x: 0, y: 0, width: resize.width, height: resize.height))
        // 获取新的图片
        if let resizeImage: UIImage = UIGraphicsGetImageFromCurrentImageContext() {
            // 关闭上下文
            UIGraphicsEndImageContext()
            return resizeImage
        }
        // 获取新的图片失败 返回原图片
        return self
    }
    
    /**
     *  等比率缩放 成功则返回新图片，失败则返回原图片
     */
    open func scale(_ scale: CGFloat) -> UIImage {
        let newSize = CGSize.init(width: self.size.width * scale, height: self.size.height * scale)
        return resize(newSize)
    }
}
