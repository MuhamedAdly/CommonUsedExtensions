//
//  UITextField.swift
//  Baitooty
//
//  Created by Mohamed Adly on 9/13/18.
//  Copyright © 2018 genericdev. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func hideTypingCursor() {
        self.tintColor = .clear
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

