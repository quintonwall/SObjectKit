//
//  Address.swift
//  Pods
//
//  Created by QUINTON WALL on 11/29/16.
//
//

import Foundation
import SwiftyJSON



public final class Address {
  
    public var street : String!
    public var city : String!
    public var state : String!
    //abbreviated 2 char US state codes. eg: CA for California
    public var stateCode : String!
    public var zip : String!
    public var longitude : Double!
    public var latitude : Double!
}
