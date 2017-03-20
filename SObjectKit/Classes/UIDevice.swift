//
//  UIDevice.swift
//  DHNative
//
//  Created by QUINTON WALL on 7/31/16.
//  Copyright © 2016 Quinton Wall. All rights reserved.
//

import UIKit

public extension UIDevice {
    public static func IS_568_SCREEN() -> Bool {
        return UIScreen.main.bounds.size.height == 568
    }
    
    public static func IS_IPHONE() -> Bool {
        return (UIDevice.current.model as NSString).range(of: "iPhone").location != NSNotFound
    }
    
    public static func IS_IPOD() -> Bool {
        return ((UIDevice.current.model as NSString).range(of: "iPod").location != NSNotFound)
    }
    
    public static func IS_IPAD() -> Bool {
        return ((UIDevice.current.model as NSString).range(of: "iPad").location != NSNotFound)
    }
    
    public static func IS_IOS7_OR_GREATER() -> Bool {
        return SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO("7")
    }
    
    public static func IS_IOS8_OR_GREATER() -> Bool {
        return SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO("8")
    }
    
    public static func SYSTEM_VERSION_EQUAL_TO(_ v: String) -> Bool {
        return UIDevice.current.systemVersion.compare(v, options: .numeric, range: nil, locale: nil) == .orderedSame
    }
    
    public static func SYSTEM_VERSION_GREATER_THAN(_ v: String) -> Bool {
        return UIDevice.current.systemVersion.compare(v, options: .numeric, range: nil, locale: nil) == .orderedDescending
    }
    
    public static func SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(_ v: String) -> Bool {
        return UIDevice.current.systemVersion.compare(v, options: .numeric, range: nil, locale: nil) != .orderedAscending
    }
    
    public static func SYSTEM_VERSION_LESS_THAN(_ v: String) -> Bool {
        return UIDevice.current.systemVersion.compare(v, options: .numeric, range: nil, locale: nil) == .orderedAscending
    }
    
    public static func SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(_ v: String) -> Bool {
        return UIDevice.current.systemVersion.compare(v, options: .numeric, range: nil, locale: nil) != .orderedDescending
    }
}
