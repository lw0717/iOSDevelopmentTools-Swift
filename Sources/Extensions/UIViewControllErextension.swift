//
//  UIViewControllErextension.swift
//  LWiOSDevelopmentTools
//
//  Created by lw0717 on 17/1/5.
//  Copyright © 2017年 lw0717. All rights reserved.
//

import UIKit

extension UIViewController {
    // 扩展UIViewController 用于检测弹出键盘是否挡住输入框
    // 该弹出键盘的办法还有一些bug，比如在navigationBar.isTranslucent = false会出现一些bug，待解决
    public func addKeyboardNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc open func keyboardWillShow(notification: NSNotification) {
        if let userInfo = notification.userInfo,
            let value = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue,
            let firstResponder = UIResponder.firstResponder() {
            let keyboardFrame = value.cgRectValue
            if let textField = firstResponder as? UITextField {
                let responderTextFrame = textField.convert(textField.frame, to: view)
                let distanceToKeyboard = keyboardFrame.origin.y - responderTextFrame.maxY - 10.0
                if distanceToKeyboard < 0 {
                    view.frame.origin.y -= -distanceToKeyboard
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3, execute: {
                        if self.view.frame.origin.y != distanceToKeyboard {
                            UIView.animate(withDuration: 0.25, animations: {
                                self.view.frame.origin.y = distanceToKeyboard
                            })
                        }
                    })
                }
            }else if let textView = firstResponder as? UITextView {
                let responderTextFrame = textView.convert(textView.frame, to: view)
                let distanceToKeyboard = keyboardFrame.origin.y - responderTextFrame.maxY - 10.0
                if distanceToKeyboard < 0 {
                    view.frame.origin.y -= -distanceToKeyboard
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3, execute: {
                        if self.view.frame.origin.y != distanceToKeyboard {
                            UIView.animate(withDuration: 0.25, animations: {
                                self.view.frame.origin.y = distanceToKeyboard
                            })
                        }
                    })
                }
            }else {
                //
            }
        }
    }
    
    @objc open func keyboardWillHide() {
        self.view.frame.origin.y = 0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3, execute: {
            if self.view.frame.origin.y != 0 {
                UIView.animate(withDuration: 0.25, animations: {
                    self.view.frame.origin.y = 0
                })
            }
        })
    }
    
}

