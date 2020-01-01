//
//  String.swift
//
//  Created by Mohamed Adly on 7/14/18.
//  Copyright © 2018 genericdev. All rights reserved.
//

import Foundation
import CoreGraphics
import CoreText
import UIKit

extension String {
    
    func validateEmail() -> (Bool, String) {
        let invalidDescription = "Invalid Email"
        guard !self.isEmpty else { return (false, invalidDescription) }
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        if pred.evaluate(with: self) {
            return (true, "")
        }
        return (false, invalidDescription)
    }
    
    func isValidPassword(testStr:String?) -> (Bool,String) {
        let invalidDescription = "Invalid Password"
        let emptyDescription = "Password should not be empty"
        guard !self.isEmpty else { return (false, emptyDescription) }
        // at least one uppercase,
        // at least one digit
        // at least one lowercase
        // 8 characters total
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        if passwordTest.evaluate(with: testStr) {
            return (true, "")
        }
        return (false, invalidDescription)
    }
    
    func isValidPhoneNo() -> (Bool,String) {
        let invalidDescription = "Invalid Phone Number"
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
            if let res = matches.first {
                if res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count {
                    return (true, "")
                }
            } else {
                return (false, invalidDescription)
            }
        } catch {
            return (false, invalidDescription)
        }
        return (false, invalidDescription)
    }
    
    var isNumeric: Bool {
        return Float(self) != nil
    }
    
    func size( _ font: UIFont, constrainedToWidth width: Double) -> CGSize {
        let attributes = [NSAttributedStringKey.font: font]
        let attString = NSAttributedString(string: self,attributes: attributes)
        let framesetter = CTFramesetterCreateWithAttributedString(attString)
        return CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRange(location: 0,length: 0), nil, CGSize(width: width, height: .greatestFiniteMagnitude), nil)
    }
    
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
    
    func deletingAnyPrefix(_ prefix: String) -> String {
        var myString = self
        while myString.hasPrefix(prefix) {
            myString = deletingPrefix(prefix)
        }
        return myString
    }
    
    static func randomCode(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let stringCode = String((0..<length).map{ _ in letters.randomElement()! })
        let numbers = "0123456789"
        let numberCode = String((0..<length).map{ _ in numbers.randomElement()! })
        return stringCode.uppercased() + "-" + numberCode
    }
}
