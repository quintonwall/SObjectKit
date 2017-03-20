//
//  NSDate.swift
//  DHNative
//
//  Created by QUINTON WALL on 7/31/16.
//  Copyright © 2016 Quinton Wall. All rights reserved.
//

import Foundation

public extension Date {
    
    fileprivate struct Static {
        static var formatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.S'Z'"
            return formatter
        }()
    }
    
    //Salesforce uses RFC3339String date format
    public func toSalesforceString() -> String {
        let formatter = Static.formatter
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.S'Z'"
        return formatter.string(from: self)
    }
    
    //Salesforce uses RFC3339String date format
    public static func dateFromSalesforceString(_ string: String) -> Date? {
        return dateFromString(string, withFormat: "yyyy-MM-dd'T'HH:mm:ss.S'Z'")
    }
    
    public func toPrettyString() -> String {
        let formatter = Static.formatter
        formatter.dateFormat = "E MMM dd, yyyy 'at' h:mm a"
        return formatter.string(from: self)
    }
    
    public func toShortPrettyString() -> String {
        let formatter = Static.formatter
        formatter.dateFormat = "MM/dd/yy"
        return formatter.string(from: self)
    }
    
    public static func dateFromString(_ dateString: String, withFormat format: String) -> Date? {
        let formatter = Static.formatter
        formatter.dateFormat = format
        return formatter.date(from: dateString)
    }
    
    public func beginningOfDay() -> Date {
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components([.year, .month, .day], from: self)
        return calendar.date(from: components)!
    }
    
    public func endOfDay() -> Date {
        var components = DateComponents()
        components.day = 1
        var date = (Calendar.current as NSCalendar).date(byAdding: components, to: self.beginningOfDay(), options: [])!
        date = date.addingTimeInterval(-1)
        return date
    }
    
}
