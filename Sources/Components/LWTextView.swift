//
//  LWTextView.swift
//  LWiOSDevelopmentTools
//
//  Created by lw0717 on 17/1/13.
//  Copyright © 2017年 SMH. All rights reserved.
//

import UIKit

@IBDesignable class LWTextView: UITextView {
    // 自定义含有placeholder的UITextView
    @IBInspectable var placeholder: String? {
        // 为了在storyboard中显示该属性而设置为存储属性，在storyboard中计算属性是否会没有效果
        didSet {
            placeholderLabel.text = placeholder
            setNeedsLayout()
        }
    }
    
    @IBInspectable var placeholderColor: UIColor? {
        // 为了在storyboard中显示该属性而设置为存储属性，在storyboard中计算属性是否会没有效果
        didSet {
            placeholderLabel.textColor = placeholderColor
        }
    }
    
    override var font: UIFont? {
        willSet(newFont) {
            super.font = newFont
            placeholderLabel.font = newFont
            setNeedsLayout()
        }
    }
    
    override var text: String! {
        willSet(newString) {
            super.text = newString
            textDidChange()
        }
    }
    
    override var attributedText: NSAttributedString! {
        willSet(newString) {
            super.attributedText = newString
            textDidChange()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private let placeholderLabel: UILabel = UILabel.init()
    
    convenience init() {
        self.init(frame: CGRect.zero, textContainer: nil)
    }
    
    convenience init(frame: CGRect) {
        self.init(frame: frame, textContainer: nil)
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        initialSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialSetup()
        //fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        placeholderLabel.backgroundColor = UIColor.clear
        placeholderLabel.numberOfLines = 0
        placeholderLabel.font = UIFont.systemFont(ofSize: 15.0)
        placeholderLabel.text = placeholder
        placeholderLabel.textColor = placeholderColor
        self.addSubview(placeholderLabel)
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange), name: NSNotification.Name.UITextViewTextDidChange, object: self)
    }
    
    @objc private func textDidChange() {
        placeholderLabel.isHidden = hasText
        // 子view的isHidden的变化不会触发layoutSubviews
        // 经过测试可知，系统的控件有的subView在layoutSubviews中是不初始化的，然后当view展示后改变这些subView的状态是无效的
        // 所以呢，那些可能显示的subView，都应该在subView中初始化
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let y: CGFloat = 8
        let x: CGFloat = 5
        let width: CGFloat = bounds.width - x * 2.0
        let maxSize = CGSize.init(width: width, height: CGFloat(MAXFLOAT))
        var height: CGFloat = 0
        if let placeholder = placeholder {
            let size = placeholder.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: placeholderLabel.font, ], context: nil)
            height = size.height
        }
        placeholderLabel.frame = CGRect.init(x: x, y: y, width: width, height: height)
    }
    
}
