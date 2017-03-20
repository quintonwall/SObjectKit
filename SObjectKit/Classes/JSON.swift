//
//  JSON.swift
//  Pods
//
//  Created by QUINTON WALL on 11/29/16.
//
//


import SwiftyJSON

extension JSON {
    public var date: Date? {
        get {
            if let str = self.string {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
                let date = dateFormatter.date(from: str)
                return date
                
            }
            return nil
        }
    }
    
    public var systemdate: Date? {
        get {
            if let str = self.string {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.AAZZZZZ"
                dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
                let date = dateFormatter.date(from: str)
                
                return date
                
            }
            return nil
        }
    }
    
}
