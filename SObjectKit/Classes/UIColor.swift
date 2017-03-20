//
//  UIColor.swift
//  dreamhousenative
//
//  Created by Quinton Wall on 7/21/16.
//  Copyright © 2016 Quinton Wall. All rights reserved.
//
import Foundation
import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    public class func hsb(_ h: CGFloat, _ s: CGFloat, _ b: CGFloat) -> UIColor {
        return UIColor(hue: h, saturation: s, brightness: b, alpha: 1.0)
    }
  
    
    public class func flatBlackColor() -> UIColor {
        return hsb(0, 0, 17)
    }
    
    public class func flatBlueColor() -> UIColor {
        return hsb(224, 50, 63)
    }
    
    public class func flatBrownColor() -> UIColor {
        return hsb(24, 45, 37)
    }
    
    public class func flatCoffeeColor() -> UIColor {
        return hsb(25, 31, 64)
    }
    
    public class func flatForestGreenColor() -> UIColor {
        return hsb(138, 45, 37)
    }
    
    public class func flatGrayColor() -> UIColor {
        return hsb(184, 10, 65)
    }
    
    public class func flatGreenColor() -> UIColor {
        return hsb(145, 77, 80)
    }
    
    public class func flatLimeColor() -> UIColor {
        return hsb(74, 70, 78)
    }
    
    public class func flatMagentaColor() -> UIColor {
        return hsb(283, 51, 71)
    }
    
    public class func flatMaroonColor() -> UIColor {
        return hsb(5, 65, 47)
    }
    
    public class func flatMintColor() -> UIColor {
        return hsb(168, 86, 74)
    }
    
    public class func flatNavyBlueColor() -> UIColor {
        return hsb(210, 45, 37)
    }
    
    public class func flatOrangeColor() -> UIColor {
        return hsb(28, 85, 90)
    }
    
    public class func flatPinkColor() -> UIColor {
        return hsb(324, 49, 96)
    }
    
    public class func flatPlumColor() -> UIColor {
        return hsb(300, 45, 37)
    }
    
    public class func flatPowderBlueColor() -> UIColor {
        return hsb(222, 24, 95)
    }
    
    public class func flatPurpleColor() -> UIColor {
        return hsb(253, 52, 77)
    }
    
    public class func flatRedColor() -> UIColor {
        return hsb(6, 74, 91)
    }
    
    public class func flatSandColor() -> UIColor {
        return hsb(42, 25, 94)
    }
    
    public class func flatSkyBlueColor() -> UIColor {
        return hsb(204, 76, 86)
    }
    
    public class func flatTealColor() -> UIColor {
        return hsb(195, 55, 51)
    }
    
    public class func flatWatermelonColor() -> UIColor {
        return hsb(356, 53, 94)
    }
    
    public class func flatWhiteColor() -> UIColor {
        return hsb(192, 2, 95)
    }
    
    public class func flatYellowColor() -> UIColor {
        return hsb(48, 99, 100)
    }
    
    public class func flatBlackColorDark() -> UIColor {
        return hsb(0, 0, 15)
    }
    
    public class func flatBlueColorDark() -> UIColor {
        return hsb(224, 56, 51)
    }
    
    public class func flatBrownColorDark() -> UIColor {
        return hsb(25, 45, 31)
    }
    
    public class func flatCoffeeColorDark() -> UIColor {
        return hsb(25, 34, 56)
    }
    
    public class func flatForestGreenColorDark() -> UIColor {
        return hsb(135, 44, 31)
    }
    
    public class func flatGrayColorDark() -> UIColor {
        return hsb(184, 10, 55)
    }
    
    public class func flatGreenColorDark() -> UIColor {
        return hsb(145, 78, 68)
    }
    
    public class func flatLimeColorDark() -> UIColor {
        return hsb(74, 81, 69)
    }
    
    public class func flatMagentaColorDark() -> UIColor {
        return hsb(282, 61, 68)
    }
    
    public class func flatMaroonColorDark() -> UIColor {
        return hsb(4, 68, 40)
    }
    
    public class func flatMintColorDark() -> UIColor {
        return hsb(168, 86, 63)
    }
    
    public class func flatNavyBlueColorDark() -> UIColor {
        return hsb(210, 45, 31)
    }
    
    public class func flatOrangeColorDark() -> UIColor {
        return hsb(24, 100, 83)
    }
    
    public class func flatPinkColorDark() -> UIColor {
        return hsb(327, 57, 83)
    }
    
    public class func flatPlumColorDark() -> UIColor {
        return hsb(300, 46, 31)
    }
    
    public class func flatPowderBlueColorDark() -> UIColor {
        return hsb(222, 28, 84)
    }
    
    public class func flatPurpleColorDark() -> UIColor {
        return hsb(253, 56, 64)
    }
    
    public class func flatRedColorDark() -> UIColor {
        return hsb(6, 78, 75)
    }
    
    public class func flatSandColorDark() -> UIColor {
        return hsb(42, 30, 84)
    }
    
    public class func flatSkyBlueColorDark() -> UIColor {
        return hsb(204, 78, 73)
    }
    
    public class func flatTealColorDark() -> UIColor {
        return hsb(196, 54, 45)
    }
    
    public class func flatWatermelonColorDark() -> UIColor {
        return hsb(358, 61, 85)
    }
    
    public class func flatWhiteColorDark() -> UIColor {
        return hsb(204, 5, 78)
    }
    
    public class func flatYellowColorDark() -> UIColor {
        return hsb(40, 100, 100)
    }
    
}
