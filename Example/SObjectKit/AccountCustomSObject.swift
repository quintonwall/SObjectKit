//
//  AccountCustomSObject.swift
//  SObjectKit
//
//  Created by QUINTON WALL on 12/7/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import SObjectKit
import SwiftyJSON

class AccountCustomSObject : Account, CustomSObject {
    
var GlassdoorRating : Int?
   var IsNonProfit : Bool?
    
    
     override init(json: JSON) {
        super.init(json: json)
        
        GlassdoorRating = json["GlassdoorRating__c"].int
        IsNonProfit = json["IsNonProfit__c"].boolValue
        
    }
    
    // Description: customsobject protocol requires you to implement this method
    static func customFieldNames() -> [String] {
        return ["GlassdoorRating__c, IsNonProfit__c"]
    }
    
    //
    // Description: This func is not required to be overridden for custom objects, but it makes it easier for downstream usage
    //
    override class func populateToCollection(records : NSArray)  -> [SObject] {
        var allrecords : [AccountCustomSObject] = []
        
        let j = JSON(records)
        for (_, subJson) in j {
            allrecords.append(AccountCustomSObject(json: subJson))
        }
        
        return allrecords
        
    }

}
