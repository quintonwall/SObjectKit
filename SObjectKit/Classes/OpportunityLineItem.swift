//
//  OpportunityLineItem.swift
//  Pods
//
//  Created by QUINTON WALL on 12/7/16.
//
//

import Foundation
import SwiftyJSON



public final class OpportunityLineItem : SObject  {


    public var Description : String?
    public var IsDeleted : Bool?
    public var ListPrice : Double?
    public var Name : String?
    public var OpportunityId : String?
    public var PricebookEntryId : String?
    public var Product2Id : String?
    public var ProductCode : String?
    public var Quantity : Int?
    public var ServiceDate : Date?
    public var SortOrder : Int?
    public var TotalPrice : Double?
    public var UnitPrice : Double?

    override public class func populateToCollection(_ records : NSArray)  -> [SObject] {
        var allrecords : [OpportunityLineItem] = []
        
        let j = JSON(records)
        for (_, subJson) in j {
            allrecords.append(OpportunityLineItem(json: subJson))
        }
        
        return allrecords
        
    }

    override public class func soqlGetAllFields(_ id: String?)  -> String {
        
       return configSOQLStatement(id, soqlbase: "select CreatedById, CreatedDate, Description, Id, IsDeleted, LastModifiedById, LastModifiedDate, ListPrice, Name, OpportunityId, PricebookEntryId, Product2Id, ProductCode, Quantity, ServiceDate, SortOrder, SystemModstamp, TotalPrice, UnitPrice from OpportunityLineItem")        
    }
    
    public class func soqlGetLineItemsForOpportunity(_ opportunityid: String) -> String {
        return self.soqlGetAllFields(nil)+" where OpportunityId = '\(opportunityid)'"
    }


    public init(json: JSON) {
        super.init(objectType: SObjectType.OpportunityLineItem, json: json)
        
        Name = json["Name"].stringValue
        Description = json["Description"].stringValue
        IsDeleted = json["IsDeleted"].boolValue
        ListPrice = json["ListPrice"].doubleValue
        OpportunityId = json["OpportunityId"].stringValue
        PricebookEntryId = json["PricebookEntryId"].stringValue
        Product2Id = json["Product2Id"].stringValue
        ProductCode = json["ProductCode"].stringValue
        Quantity = json["Quantity"].int
        ServiceDate = json["ServiceDate"].date
        SortOrder = json["SortOrder"].int
        TotalPrice = json["TotalPrice"].doubleValue
        UnitPrice = json["UnitPrice"].doubleValue
    }

}
