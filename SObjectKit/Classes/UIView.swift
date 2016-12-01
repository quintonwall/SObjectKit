//
//  UIView.swift
//  DHNative
//
//  Created by QUINTON WALL on 7/31/16.
//  Copyright © 2016 Quinton Wall. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func makeRound() {
        self.contentMode = .ScaleAspectFill;
        self.clipsToBounds = true;
        var f = self.frame;
        let w = CGRectGetWidth(f);
        let h = CGRectGetHeight(f);
        var corner = w;
        if (h > w) { // Portrait Orientation
            f.size.height = w;
        } else if (w > h) { // Landscape Orientation
            f.size.width = h;
            corner = h;
        }
        self.frame = f;
        self.layer.cornerRadius = (corner / 2);
    }
    
    public func makeRoundWithBorder(width width: CGFloat, color: UIColor) {
        makeRound()
        layer.borderWidth = width
        layer.borderColor = color.CGColor
    }
    
    public class func loadFromNibNamed(nibNamed: String, bundle : NSBundle? = nil) -> UIView? {
        return UINib(nibName: nibNamed, bundle: bundle).instantiateWithOwner(nil, options: nil).first as? UIView
    }
    
}

public protocol UIViewLoading {}
extension UIView : UIViewLoading {}
public extension UIViewLoading where Self : UIView {
    
    public static func loadFromNib() -> Self {
        let nibName = "\(self)".characters.split{$0 == "."}.map(String.init).last!
        let bundle = NSBundle(forClass: Self.self)
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiateWithOwner(self, options: nil).first as! Self
    }
    
}