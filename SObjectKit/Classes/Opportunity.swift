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
    
    public var account : Account?
    public var Amount : String?
    public var CampaignId : String?
    public var CloseDate : String?
    public var Description : String?
    public var ExpectedRevenue : String?
    public var Fiscal : String?
    public var FiscalQuarter : String?
    public var FiscalYear : String?
    public var ForecastCategory : String?
    public var ForecastCategoryName : String?
    public var HasOpenActivity : String?
    public var HasOpportunityLineItem : String?
    public var HasOverdueTask : String?
    public var IsClosed : String?
    public var LastViewedDate : String?
    public var LeadSource : String?
    public var Name : String?
    public var NextStep : String?
    public var OwnerId : String?
    public var Pricebook2Id : String?
    public var Probability : String?
    public var StageName : String?
    public var TotalOpportunityQuantity : String?
    
    
    
    override public class func populateToCollection(records : NSArray)  -> [SObject] {
        var allrecords : [Opportunity] = []
        
        let j = JSON(records)
        for (_, subJson) in j {
            allrecords.append(Opportunity(json: subJson))
        }
        
        return allrecords
        
    }
    
    override public class func soqlGetAllStandardFields()  -> String {
        return "select AccountId, Amount, CampaignId, CloseDate, CreatedById, CreatedDate, Description, ExpectedRevenue, Fiscal, FiscalQuarter, FiscalYear, ForecastCategory, ForecastCategoryName, HasOpenActivity, HasOpportunityLineItem, HasOverdueTask, Id, IsClosed, IsDeleted, IsPrivate, IsWon, LastActivityDate, LastModifiedById, LastModifiedDate, LastReferencedDate, LastViewedDate, LeadSource, Name, NextStep, OwnerId, Pricebook2Id, Probability, StageName, SystemModstamp, TotalOpportunityQuantity Type from Opportunity"
    }
    
    
    
    
    public init(json: JSON) {
        super.init(objectType: SObjectType.Opportunity, json: json)
        
    }
}
