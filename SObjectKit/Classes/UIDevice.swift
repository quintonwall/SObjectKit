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
        return UIScreen.mainScreen().bounds.size.height == 568
    }
    
    public static func IS_IPHONE() -> Bool {
        return (UIDevice.currentDevice().model as NSString).rangeOfString("iPhone").location != NSNotFound
    }
    
    public static func IS_IPOD() -> Bool {
        return ((UIDevice.currentDevice().model as NSString).rangeOfString("iPod").location != NSNotFound)
    }
    
    public static func IS_IPAD() -> Bool {
        return ((UIDevice.currentDevice().model as NSString).rangeOfString("iPad").location != NSNotFound)
    }
    
    public static func IS_IOS7_OR_GREATER() -> Bool {
        return SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO("7")
    }
    
    public static func IS_IOS8_OR_GREATER() -> Bool {
        return SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO("8")
    }
    
    public static func SYSTEM_VERSION_EQUAL_TO(v: String) -> Bool {
        return UIDevice.currentDevice().systemVersion.compare(v, options: .NumericSearch, range: nil, locale: nil) == .OrderedSame
    }
    
    public static func SYSTEM_VERSION_GREATER_THAN(v: String) -> Bool {
        return UIDevice.currentDevice().systemVersion.compare(v, options: .NumericSearch, range: nil, locale: nil) == .OrderedDescending
    }
    
    public static func SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v: String) -> Bool {
        return UIDevice.currentDevice().systemVersion.compare(v, options: .NumericSearch, range: nil, locale: nil) != .OrderedAscending
    }
    
    public static func SYSTEM_VERSION_LESS_THAN(v: String) -> Bool {
        return UIDevice.currentDevice().systemVersion.compare(v, options: .NumericSearch, range: nil, locale: nil) == .OrderedAscending
    }
    
    public static func SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v: String) -> Bool {
        return UIDevice.currentDevice().systemVersion.compare(v, options: .NumericSearch, range: nil, locale: nil) != .OrderedDescending
    }
}
