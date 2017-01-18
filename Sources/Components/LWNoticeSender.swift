//
//  LWNoticeSender.swift
//  LWiOSDevelopmentTools
//
//  Created by lw0717 on 16/12/1.
//  Copyright © 2016年 SMH. All rights reserved.
//

import UIKit

class LWNoticeSender: NSObject {
    // 用于全局提醒功能的组件
    static private let minNoticeWidth: CGFloat = 50.0
    static private let maxNoticeWidth: CGFloat = UIScreen.main.bounds.width - 50.0
    static private let minNoticeHeight: CGFloat = 30.0
    static private let maxNoticeheight: CGFloat = UIScreen.main.bounds.height - 100.0
    
    static var backgroundColor: UIColor = UIColor.gray
    static var font: UIFont = UIFont.systemFont(ofSize: 15.0)
    static var textColor: UIColor = UIColor.white
    static var maxAlpha: CGFloat = 1.0
    static var cornerRadius: CGFloat = 3.0
    static var textAlignment: NSTextAlignment = .center
    //static var duration: DispatchTime
    
    static func showNotice(with message: String) {
        if let window = UIApplication.shared.keyWindow {
            showNotice(message: message, in: window)
        }
    }
    
    static private func showNotice(message: String, in parentView: UIView) {
        let maxSize = CGSize.init(width: maxNoticeWidth, height: maxNoticeheight)
        let messageSize = message.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font,], context: nil)
        
        var size = CGSize.init(width: messageSize.width + 10, height: messageSize.height + 20)
        if size.width < minNoticeWidth {
            size.width = minNoticeWidth
        }
        if size.height < minNoticeHeight {
            size.height = minNoticeHeight
        }
        
        let noticeViewWidth = size.width + 10.0
        let noticeViewHeight = size.height + 5.0
        
        let noticeView: UIView = UIView.init(frame: CGRect.init(x: (parentView.frame.width - noticeViewWidth) / 2.0, y: (parentView.frame.height - noticeViewHeight) / 2.0, width: noticeViewWidth, height: noticeViewHeight))
        noticeView.backgroundColor = backgroundColor
        noticeView.layer.masksToBounds = true
        noticeView.layer.cornerRadius = cornerRadius
        
        let messageLabel = UILabel.init(frame: CGRect.init(x: (noticeView.frame.width - size.width) / 2.0, y: (noticeView.frame.height - size.height) / 2.0, width: size.width, height: size.height))
        messageLabel.font = font
        messageLabel.textAlignment = textAlignment
        messageLabel.textColor = textColor
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        
        noticeView.addSubview(messageLabel)
        parentView.addSubview(noticeView)
        noticeView.alpha = 0.0
        
        UIView.animate(withDuration: 0.25, animations: {
            noticeView.alpha = maxAlpha
        }, completion: { (finished: Bool) in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
                //print("after!")
                performHide(noticeView: noticeView)
            }
        })
    }
    
    static private func performHide(noticeView: UIView) {
        UIView.animate(withDuration: 0.25, animations: {
            noticeView.alpha = maxAlpha
        }, completion: { (finished: Bool) in
            noticeView.removeFromSuperview()
        })
    }

}
