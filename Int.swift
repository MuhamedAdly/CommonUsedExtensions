//
//  Int.swift
//
//  Created by Mohamed Adly on 9/13/18.
//  Copyright © 2018 genericdev. All rights reserved.
//

import Foundation
extension Int64 {
    
    func timeString() -> String {
        let date = Date(timeIntervalSince1970: Double(self/1000))
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    func date() -> Date {
        let date = Date(timeIntervalSince1970: Double(self/1000))
        return date
    }
    
}
