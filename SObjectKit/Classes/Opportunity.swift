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
    public var Amount : Double?
    public var CampaignId : String?
    public var CloseDate : NSDate?
    public var Description : String?
    public var ExpectedRevenue : Double?
    public var Fiscal : String?
    public var FiscalQuarter : String?
    public var FiscalYear : String?
    public var ForecastCategory : String?
    public var ForecastCategoryName : String?
    public var HasOpenActivity : Bool?
    public var HasOpportunityLineItem : Bool?
    public var HasOverdueTask : Bool?
    public var IsClosed : Bool?
    public var LastViewedDate : NSDate?
    public var LeadSource : String?
    public var Name : String?
    public var NextStep : String?
    public var OwnerId : String?
    public var Pricebook2Id : String?
    public var Probability : String?
    public var StageName : String?
    public var TotalOpportunityQuantity : Double?
    
    
    
    override public class func populateToCollection(records : NSArray)  -> [SObject] {
        var allrecords : [Opportunity] = []
        
        let j = JSON(records)
        for (_, subJson) in j {
            allrecords.append(Opportunity(json: subJson))
        }
        
        return allrecords
        
    }
    
    override public class func soqlGetAllStandardFields(id: String?)  -> String {
        
        var soql = "select AccountId, Amount, CampaignId, CloseDate, CreatedById, CreatedDate, Description, ExpectedRevenue, Fiscal, FiscalQuarter, FiscalYear, ForecastCategory, ForecastCategoryName, HasOpenActivity, HasOpportunityLineItem, HasOverdueTask, Id, IsClosed, IsDeleted, IsPrivate, IsWon, LastActivityDate, LastModifiedById, LastModifiedDate, LastReferencedDate, LastViewedDate, LeadSource, Name, NextStep, OwnerId, Pricebook2Id, Probability, StageName, SystemModstamp, TotalOpportunityQuantity, Type from Opportunity"
        
        if (id ?? "").isEmpty {
            return soql
        } else {
            return "\(soql) where id = '\(id)'"
        }
        
    }
    
    public class func soqlGetOpportunitiesForAccount(accountid: String) -> String {
        return self.soqlGetAllStandardFields(nil)+" where Accountid = '\(accountid)'"
    }
    
    
    
    
    public init(json: JSON) {
        super.init(objectType: SObjectType.Opportunity, json: json)
        
        account = Account(id: json["AccountId"].stringValue)
        Amount = json["Amount"].doubleValue
        CampaignId = json["CampaignId"].stringValue
        CloseDate = json["CloseDate"].date
        Description = json["Description"].stringValue
        ExpectedRevenue = json["ExpectedRevenue"].doubleValue
        Fiscal = json["Fiscal"].stringValue
        FiscalQuarter = json["FiscalQuarter"].stringValue
        FiscalYear = json["FiscalYear"].stringValue
        ForecastCategory = json["ForecastCategory"].stringValue
        ForecastCategoryName = json["ForecastCategoryName"].stringValue
        HasOpenActivity = json["HasOpenActivity"].boolValue
        HasOpportunityLineItem = json["HasOpportunityLineItem"].boolValue
        HasOverdueTask = json["HasOverdueTask"].boolValue
        IsClosed = json["IsClosed"].boolValue
        LastViewedDate = json["LastViewedDate"].date
        LeadSource = json["LeadSource"].stringValue
        Name = json["Name"].stringValue
        NextStep = json["NextStep"].stringValue
        OwnerId = json["OwnerId"].stringValue
        Pricebook2Id = json["Pricebook2Id"].stringValue
        Probability = json["Probability"].stringValue
        StageName = json["StageName"].stringValue
        TotalOpportunityQuantity = json["TotalOpportunityQuantity"].doubleValue
        
    }
}
