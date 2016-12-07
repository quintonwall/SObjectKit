//
//  PricebookEntry.swift
//  Pods
//
//  Created by QUINTON WALL on 12/7/16.
//
//

import Foundation
import SwiftyJSON



public final class PricebookEntry : SObject  {
    
    public var Description : String?
    public var IsActive : Bool?
    public var IsDeleted : Bool?
    public var Name : String?
    public var UnitPrice : Double?
    public var UseStandardPrice : Bool?
    public var ProductCode : String?
    public var Product2Id : String?
    public var Pricebook2Id : String?
    
    override public class func populateToCollection(records : NSArray)  -> [SObject] {
        var allrecords : [PricebookEntry] = []
        
        let j = JSON(records)
        for (_, subJson) in j {
            allrecords.append(PricebookEntry(json: subJson))
        }
        
        return allrecords
        
    }
    
    override public class func soqlGetAllStandardFields(id: String?)  -> String {
        
        var soql = "select CreatedById, CreatedDate, Id, IsActive, IsDeleted, LastModifiedById, LastModifiedDate, Name, Pricebook2Id, Product2Id, ProductCode, SystemModstamp, UnitPrice, UseStandardPrice from PricebookEntry"
        
        if (id ?? "").isEmpty {
            return soql
        } else {
            return "\(soql) where id = '\(id)'"
        }
        
    }
    
    public class func soqlGetPricebookEntriesForProduct(productid: String) -> String {
        return self.soqlGetAllStandardFields(nil)+" where Product2Id = '\(productid)'"
    }
    
    
    public init(json: JSON) {
        super.init(objectType: SObjectType.PricebookEntry, json: json)
        
        Name = json["Name"].stringValue
        Description = json["Description"].stringValue
        ProductCode = json["ProductCode"].stringValue
        Pricebook2Id = json["Pricebook2Id"].stringValue
        Product2Id = json["Product2Id"].stringValue
        IsDeleted = json["IsDeleted"].boolValue
        IsActive = json["IsActive"].boolValue
        UseStandardPrice = json["UseStandardPrice"].boolValue
        UnitPrice = json["UnitPrice"].doubleValue
        
        
        
    }
    
}
