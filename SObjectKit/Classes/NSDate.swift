//
//  NSDate.swift
//  DHNative
//
//  Created by QUINTON WALL on 7/31/16.
//  Copyright © 2016 Quinton Wall. All rights reserved.
//

import Foundation

public extension NSDate {
    
    private struct Static {
        static var formatter: NSDateFormatter = {
            let formatter = NSDateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.S'Z'"
            return formatter
        }()
    }
    
    public func toRFC3339String() -> String {
        let formatter = Static.formatter
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.S'Z'"
        return formatter.stringFromDate(self)
    }
    
    public class func dateFromRFC3339String(string: String) -> NSDate? {
        return dateFromString(string, withFormat: "yyyy-MM-dd'T'HH:mm:ss.S'Z'")
    }
    
    public func toPrettyString() -> String {
        let formatter = Static.formatter
        formatter.dateFormat = "E MMM dd, yyyy 'at' h:mm a"
        return formatter.stringFromDate(self)
    }
    
    public func toShortPrettyString() -> String {
        let formatter = Static.formatter
        formatter.dateFormat = "MM/dd/yy"
        return formatter.stringFromDate(self)
    }
    
    public class func dateFromString(dateString: String, withFormat format: String) -> NSDate? {
        let formatter = Static.formatter
        formatter.dateFormat = format
        return formatter.dateFromString(dateString)
    }
    
    public func beginningOfDay() -> NSDate {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Year, .Month, .Day], fromDate: self)
        return calendar.dateFromComponents(components)!
    }
    
    public func endOfDay() -> NSDate {
        let components = NSDateComponents()
        components.day = 1
        var date = NSCalendar.currentCalendar().dateByAddingComponents(components, toDate: self.beginningOfDay(), options: [])!
        date = date.dateByAddingTimeInterval(-1)
        return date
    }
    
}