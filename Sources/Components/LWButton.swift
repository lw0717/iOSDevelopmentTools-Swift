//
//  LWButton.swift
//  LWiOSDevelopmentTools
//
//  Created by lw0717 on 16/12/31.
//  Copyright © 2016年 lw0717. All rights reserved.
//

import UIKit

public enum LWButtonStyle {
    case top // image - top, titleLabel - bottom
    case buttom // image - bottom, titleLabel - top
    case left // image - left, titleLabel - right
    case right // image - right, titleLabel - left
}


//@IBDesignable // 动态计算计算 runtime 脚本
//@IBInspectable // 在storyboard中有对应的选项

// image位置不同的button
open class LWButton: UIButton {
    @IBInspectable open var  alphaa: CGFloat = 1 {
        didSet {
            alpha = alphaa
        }
    }
    @IBInspectable open var style: LWButtonStyle = .left {
        didSet(oldStyle) {
            if oldStyle != style {
                print("--- { \n change style: \(oldStyle) -> \(style) \n } ---")
                setNeedsLayout()
            }
        }
    }
    open var gap: CGFloat = 0.0 {
        didSet(oldGap) {
            if oldGap != gap {
                setNeedsLayout()
            }
        }
    }
    
    public convenience init(style buttonStyle: LWButtonStyle) {
        self.init(frame: CGRect.zero)
        style = buttonStyle
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init(type buttonType: UIButtonType) {
        self.init(type: buttonType)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        print("--- { \n layoutSubviews\n image frame: \(imageView?.frame) \n title frame: \(titleLabel?.frame) \n } ---")
        switch style {
        case .top:
            topStyleLayoutSubviews()
        case .buttom:
            buttomStyleLayoutSubviews()
        case .left:
            leftStyleLayoutSubviews()
        case .right:
            rightStyleLayoutSubviews()
        }
    }
    
    override open func layoutIfNeeded() {
        super.layoutIfNeeded()
        print("--- { \n layoutIfNeeded \n } ---")
    }
    
    private func topStyleLayoutSubviews() {
        if let imageFrame = imageView?.frame,
            let titleFrame = titleLabel?.frame {
            let totalHeight = imageFrame.height + titleFrame.height + gap / 2.0
            imageEdgeInsets = UIEdgeInsets.init(top: -(totalHeight - imageFrame.height), left: 0.0, bottom: 0.0, right: -titleFrame.width)
            titleEdgeInsets = UIEdgeInsets.init(top: 0.0, left: -imageFrame.width, bottom: -(totalHeight - titleFrame.height), right: 0.0)
            print("--- { \n topStyleLayoutSubviews\n image frame: \(imageView?.frame) \n title frame: \(titleLabel?.frame) \n } ---")
        }
    }
    
    private func buttomStyleLayoutSubviews() {
        if let imageFrame = imageView?.frame,
            let titleFrame = titleLabel?.frame {
            let totalHeight = imageFrame.height + titleFrame.height + gap / 2.0
            imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: -(totalHeight - imageFrame.height), right: -titleFrame.width)
            titleEdgeInsets = UIEdgeInsets.init(top: -(totalHeight - titleFrame.height), left: -imageFrame.width, bottom: 0.0, right: 0.0)
            print("--- { \n buttomStyleLayoutSubviews\n image frame: \(imageView?.frame) \n title frame: \(titleLabel?.frame) \n } ---")
        }
    }
    
    private func leftStyleLayoutSubviews() {
        if let _ = imageView?.frame,
            let _ = titleLabel?.frame {
            imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: gap / 2.0)
            titleEdgeInsets = UIEdgeInsets.init(top: 0.0, left: gap / 2.0, bottom: 0.0, right: 0.0)
            print("--- { \n leftStyleLayoutSubviews\n image frame: \(imageView?.frame) \n title frame: \(titleLabel?.frame) \n } ---")
        }
    }
    
    private func rightStyleLayoutSubviews() {
        if let imageFrame = imageView?.frame,
            let titleFrame = titleLabel?.frame {
            let totalWidth = titleFrame.width + imageFrame.width + gap / 2.0
            imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: -totalWidth)
            titleEdgeInsets = UIEdgeInsets.init(top: 0.0, left: -totalWidth, bottom: 0.0, right: 0.0)
            print("--- { \n rightStyleLayoutSubviews\n image frame: \(imageView?.frame) \n title frame: \(titleLabel?.frame) \n } ---")
        }
    }
    
}
