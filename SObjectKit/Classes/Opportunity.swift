//
//  Opportunity.swift
//  Pods
//
//  Created by QUINTON WALL on 12/1/16.
//
//

import Foundation
import SwiftyJSON

public final class Opportunity : SObject  {
    
    
    
    override public class func populateToCollection(records : NSArray)  -> [SObject] {
        var allrecords : [Opportunity] = []
        
        let j = JSON(records)
        for (_, subJson) in j {
            allrecords.append(Opportunity(json: subJson))
        }
        
        return allrecords
        
    }
    
    override public class func soqlGetAllStandardFields()  -> String {
        return ""
    }
    
    
    
    
    public init(json: JSON) {
        super.init(objectType: SObjectType.Opportunity, json: json)
        
    }
}
