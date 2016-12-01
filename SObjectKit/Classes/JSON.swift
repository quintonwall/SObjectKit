//
//  JSON.swift
//  Pods
//
//  Created by QUINTON WALL on 11/29/16.
//
//


import SwiftyJSON

extension JSON {
    public var date: NSDate? {
        get {
            if let str = self.string {
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                dateFormatter.timeZone = NSTimeZone(name: "UTC")
                let date = dateFormatter.dateFromString(str)
                return date
                
            }
            return nil
        }
    }
    
    public var systemdate: NSDate? {
        get {
            if let str = self.string {
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.AAZZZZZ"
                dateFormatter.timeZone = NSTimeZone(name: "UTC")
                let date = dateFormatter.dateFromString(str)
                
                return date
                
            }
            return nil
        }
    }
    
}