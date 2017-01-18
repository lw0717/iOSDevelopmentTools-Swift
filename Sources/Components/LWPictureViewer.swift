//
//  LWPictureViewer.swift
//  LWiOSDevelopmentTools
//
//  Created by lw0717 on 16/12/5.
//  Copyright © 2016年 SMH. All rights reserved.
//

import UIKit

class LWPictureViewer: UIView, UIScrollViewDelegate {
    
    private var oldFrame: CGRect = CGRect.zero
    private var scrollView: UIScrollView = UIScrollView()
    private var imageView: UIImageView = UIImageView()
    
    /// 浏览头像大图
    ///
    /// - Parameters:
    ///   - image: 头像所在的image
    ///   - originFrame: 头像所在的_imageView的Frame,基于[UIApplication sharedApplication].keyWindow
    static func show(image: UIImage, with originFrame: CGRect) {
        self.init().show(image: image, with: originFrame)
    }
    
    private func show(image: UIImage, with originFrame: CGRect) {
        oldFrame = originFrame
        let window: UIWindow = UIApplication.shared.keyWindow!
        self.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        self.backgroundColor = UIColor.black
        self.alpha = 0.0
        scrollView = UIScrollView.init(frame: self.bounds)
        scrollView.backgroundColor = UIColor.black
        scrollView.alpha = 0.0
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 3.0
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize.init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scrollView.delegate = self
        scrollView.isUserInteractionEnabled = true
        imageView = UIImageView.init(frame: oldFrame)
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        scrollView.addSubview(imageView)
        self.addSubview(scrollView)
        window.addSubview(self)
        window.bringSubview(toFront: self)
        
        let singleClickDog = UITapGestureRecognizer.init(target: self, action: #selector(singleClickDog(_:)))
        let doubleClickTap = UITapGestureRecognizer.init(target: self, action: #selector(handleDoubleTap(_:)))
        let twoFingerTap = UITapGestureRecognizer.init(target: self, action: #selector(handleTwoFingerTap(_:)))
        singleClickDog.numberOfTapsRequired = 1
        singleClickDog.numberOfTouchesRequired = 1
        doubleClickTap.numberOfTapsRequired = 2
        twoFingerTap.numberOfTouchesRequired = 2
        singleClickDog.require(toFail: doubleClickTap)
        self.addGestureRecognizer(singleClickDog)
        self.imageView.addGestureRecognizer(doubleClickTap)
        self.imageView.addGestureRecognizer(twoFingerTap)
        self.scrollView.setZoomScale(1.0, animated: true)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.imageView.frame = self.bounds
            self.scrollView.alpha = 1.0
            self.alpha = 1.0
        }, completion: { (finished: Bool) in
            
        })
        UIApplication.shared.isStatusBarHidden = true
    }
    
    deinit {
        //print("deinit...")
    }
    
    @objc private func singleClickDog(_ tap: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.3, animations: {
            self.imageView.frame = self.oldFrame
            self.scrollView.alpha = 0.0
            self.alpha = 0.0
        }, completion: { (finished: Bool) in
            UIApplication.shared.isStatusBarHidden = false
            self.removeFromSuperview()
        })
    }
    
    @objc private func handleDoubleTap(_ tap: UITapGestureRecognizer) {
        if tap.numberOfTapsRequired == 2 {
            if self.scrollView.zoomScale == 1 {
                let newScale = self.scrollView.zoomScale * 2.0
                let zoomRect = self.zoomRect(for: newScale, with: tap.location(in: tap.view))
                self.scrollView.zoom(to: zoomRect, animated: true)
            }else {
                let newScale = self.scrollView.zoomScale / 2.0
                let zoomRect = self.zoomRect(for: newScale, with: tap.location(in: tap.view))
                self.scrollView.zoom(to: zoomRect, animated: true)
            }
        }
    }
    
    @objc private func handleTwoFingerTap(_ tap: UITapGestureRecognizer) {
        let newScale = self.scrollView.zoomScale / 2.0
        let zoomRect = self.zoomRect(for: newScale, with: tap.location(in: tap.view))
        self.scrollView.zoom(to: zoomRect, animated: true)
    }
    
    // MARK : 缩放大小获取方法
    private func zoomRect(for scale: CGFloat, with center: CGPoint) -> CGRect {
        var zoomRect: CGRect = CGRect.zero
        zoomRect.size.height = self.scrollView.frame.height / scale
        zoomRect.size.width = self.scrollView.frame.width / scale
        
        zoomRect.origin.x = center.x - zoomRect.size.width / 2.0
        zoomRect.origin.y = center.y - zoomRect.size.height / 2.0
        return zoomRect
    }
    
    // MARK : ScrollView Delegate
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        scrollView.setZoomScale(scale, animated: false)
    }
}
