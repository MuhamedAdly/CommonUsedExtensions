//
//  Date.swift
//
//  Created by Mohamed Adly on 7/9/18.
//  Copyright © 2018 genericdev. All rights reserved.
//

import Foundation

extension Date {
    
    func formatedString() -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
    
    func dateTimeString() -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
    
    func shortedFormatedString() -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yy"
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
    
    func timeString(ignoreLocalization: Bool = false) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        if ignoreLocalization {
            dateFormatter.calendar = Calendar(identifier: .iso8601)
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        }
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
    
    func hourString(ignoreLocalization: Bool = false) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        if ignoreLocalization {
            dateFormatter.calendar = Calendar(identifier: .iso8601)
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        }
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
    
    
    func shortDateTimeString() -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
    
    func unix() -> Int64 {
        return Int64(self.timeIntervalSince1970)*1000
    }
    
    func timeToMilliSeconds(ignoreLocalization: Bool = false) -> Int64 {
        var calendar = Calendar.current
        if ignoreLocalization {
            calendar.timeZone = TimeZone(secondsFromGMT: 0)!
            calendar.locale = Locale(identifier: "en_US_POSIX")
        }
        let time=calendar.dateComponents([.hour,.minute,.second], from: self)
        let hoursMil = time.hour! * 60 * 60
        let minsMil = time.minute! * 60
        let secsMil = time.second!
        return Int64((hoursMil + minsMil + secsMil) * 1000)
    }
    
    func dateOnlyMilliSeconds() -> Int64 {
        let time = self.timeToMilliSeconds() //* 1000
        let dateSectons = self.unix() - time
        if dateSectons > 0 {
            return dateSectons
        }
        return 0
    }
    
    func isToday() -> Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    func today(ignoreLocalization: Bool = false) -> Int {
        var calendar = Calendar.current
        if ignoreLocalization {
            calendar.timeZone = TimeZone(secondsFromGMT: 0)!
            calendar.locale = Locale(identifier: "en_US_POSIX")
        }
        let date = calendar.dateComponents([.day], from: self)
        return date.day ?? 0
    }
    
    func weekDay() -> String {
        let days = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
        let weekday = Calendar.current.component(.weekday, from: self)
        return days[weekday]
    }
    
    func month(ignoreLocalization: Bool = false) -> Int {
        var calendar = Calendar.current
        if ignoreLocalization {
            calendar.timeZone = TimeZone(secondsFromGMT: 0)!
            calendar.locale = Locale(identifier: "en_US_POSIX")
        }
        let date = calendar.dateComponents([.month], from: self)
        return date.month ?? 0
    }
    
    func year(ignoreLocalization: Bool = false) -> Int {
        var calendar = Calendar.current
        if ignoreLocalization {
            calendar.timeZone = TimeZone(secondsFromGMT: 0)!
            calendar.locale = Locale(identifier: "en_US_POSIX")
        }
        let date = calendar.dateComponents([.year], from: self)
        return date.year ?? 0
    }
}
