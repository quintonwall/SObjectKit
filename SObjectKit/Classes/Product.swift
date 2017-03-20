//
//  Product.swift
//  Pods
// Represents the Product2 sobject
//
//  Created by QUINTON WALL on 12/7/16.
//
//

import Foundation
import SwiftyJSON



public final class Product : SObject  {
    
    public var Description : String?
    public var Family : String?
    public var IsActive : Bool?
    public var IsDeleted : Bool?
    public var LastReferencedDate : Date?
    public var LastViewedDate : Date?
    public var Name : String?
    public var ProductCode : String?
    
    override public class func populateToCollection(_ records : NSArray)  -> [SObject] {
        var allrecords : [Product] = []
        
        let j = JSON(records)
        for (_, subJson) in j {
            allrecords.append(Product(json: subJson))
        }
        
        return allrecords
        
    }
    
    override public class func soqlGetAllFields(_ id: String?)  -> String {
        
        return configSOQLStatement(id, soqlbase: "select CreatedById, CreatedDate, Description, Family, Id, IsActive, IsDeleted, LastModifiedById, LastModifiedDate, LastReferencedDate, LastViewedDate, Name, ProductCode, SystemModstamp from Product2")        
    }
    
    public init(json: JSON) {
        super.init(objectType: SObjectType.Product2, json: json)
        
        Name = json["Name"].stringValue
        ProductCode = json["ProductCode"].stringValue
        LastViewedDate = json["LastViewedDate"].date
        LastReferencedDate = json["LastReferencedDate"].date
        IsDeleted = json["IsDeleted"].boolValue
        IsActive = json["IsActive"].boolValue
        Family = json["Family"].stringValue
        Description = json["Description"].stringValue
       
    }
    
}
