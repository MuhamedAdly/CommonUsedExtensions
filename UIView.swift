//
//  UIView.swift
//
//  Created by Mohamed Adly on 7/22/18.
//  Copyright © 2018 genericdev. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
   
    private static var _myComputedProperty = [String:Any]()
    
    var tagObject:Any? {
        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return UIView._myComputedProperty[tmpAddress] ?? nil
        }
        set(newValue) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            UIView._myComputedProperty[tmpAddress] = newValue
        }
    }
    
    func roundedCorner(radius : Float, borderWidth: Float, borderColor: UIColor) {
        self.layer.cornerRadius = CGFloat(radius)
        self.layer.borderWidth = CGFloat(borderWidth)
        self.layer.borderColor = borderColor.cgColor
        self.layer.masksToBounds = true;
    }
    
    func roundedCornerAsThumb() {
        roundedCorner(radius: 6, borderWidth: 1, borderColor: .black12)
    }
    
    func circular() {
        let radius = frame.width / 2.0
        roundedCorner(radius: Float(radius), borderWidth: 1, borderColor: .black12)
    }
    
    func dropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 1
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
    }
    
    func fadeOut(_ duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        })
    }
    
    func fadeIn(_ duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
        })
    }
    
    class func viewFromNibName(_ name: String) -> UIView? {
        let views = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        return views?.first as? UIView
    }
}
