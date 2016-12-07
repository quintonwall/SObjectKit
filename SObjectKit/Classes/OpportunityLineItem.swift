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



    override public class func populateToCollection(records : NSArray)  -> [SObject] {
        var allrecords : [OpportunityLineItem] = []
        
        let j = JSON(records)
        for (_, subJson) in j {
            allrecords.append(OpportunityLineItem(json: subJson))
        }
        
        return allrecords
        
    }

    override public class func soqlGetAllStandardFields(id: String?)  -> String {
        
        var soql = "select CreatedById, CreatedDate, Description, Id, IsDeleted, LastModifiedById, LastModifiedDate, ListPrice, Name, OpportunityId, PricebookEntryId, Product2Id, ProductCode, Quantity, ServiceDate, SortOrder, SystemModstamp, TotalPrice, UnitPrice from OpportunityLineItem"
        
        if (id ?? "").isEmpty {
            return soql
        } else {
            return "\(soql) where id = '\(id)'"
        }
        
    }
    
    public class func soqlGetLineItemsForOpportunity(opportunityid: String) -> String {
        return self.soqlGetAllStandardFields(nil)+" where OpportunityId = '\(opportunityid)'"
    }


    public init(json: JSON) {
        super.init(objectType: SObjectType.OpportunityLineItem, json: json)
    }

}