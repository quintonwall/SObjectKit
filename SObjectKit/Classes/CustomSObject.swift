//
//  CustomSObject.swift
//  Pods
//
//  Created by QUINTON WALL on 12/7/16.
//
//

import Foundation

//@objc
@objc public protocol CustomSObject : class {
    
    ///Description: set this for your custom fields to be included in the SelectAllFields SOQL
    //@objc var customFieldNames : [String] { get set }
    
     static func customFieldNames() -> [String]
    
    
}