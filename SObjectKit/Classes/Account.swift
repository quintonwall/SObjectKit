//
//  Account.swift
//  https://developer.salesforce.com/docs/atlas.en-us.api.meta/api/sforce_api_objects_account.htm
//
//  Created by Quinton Wall on 11/19/16.
//
//

import Foundation
import SwiftyJSON


public final class Account : SObject {
    
    
    public var AccountNumber : String?
    public var AccountSource : String?
    public var AnnualRevenue : Double = 0.0
    //public var BillingAddressStreet : String!
    //public var BillingAddressCity : String!
    //public var BillingAddressState : String!
    //public var BillingAddressZip : String!
    //public var BillingAddressLongitude : String!
    //public var BillingAddressLatitude : String!
    public var BillingAddress : Address?
    public var CleanStatus : String?
    public var DandbCompanyId : String?
    public var Description : String?
    public var DunsNumber : String?
    public var Fax : String?
    public var Industry : String?
    public var Jigsaw : String?
    public var JigsawCompanyId : String?
    public var LastActivityDate : NSDate?
    public var LastReferencedDate : NSDate?
    public var LastViewedDate : NSDate?
    public var MasterRecordId : String?
    public var NaicsCode : String?
    public var NaicsDesc : String?
    public var Name : String?
    public var NumberOfEmployees : Int?
    public var Ownership : String?
    public var ParentId : String?
    public var Phone : String?
    public var PhotoUrl : NSURL?
    public var Rating : String?
    public var ShippingAddress : Address?
    public var Sic : String?
    public var SicDesc : String?
    public var TickerSymbol : String?
    public var Tradestyle : String?
    public var Website : NSURL?
    public var YearStarted : String?
  

    public static var soqlGetAllStandardFields : String = "select AccountNumber, AccountSource, AnnualRevenue, BillingAddress, BillingGeocodeAccuracy, CleanStatus, CreatedById, CreatedDate,  DandbCompanyId, Description, DunsNumber, Fax, Id, Industry, IsDeleted, Jigsaw, JigsawCompanyId, LastActivityDate, LastModifiedById, LastModifiedDate, LastReferencedDate, LastViewedDate, MasterRecordId, NaicsCode, NaicsDesc, Name, NumberOfEmployees,  OwnerId, Ownership, ParentId, Phone, PhotoUrl, Rating, ShippingAddress, ShippingGeocodeAccuracy, Sic, SicDesc, Site, SystemModstamp, TickerSymbol, Tradestyle, Type, Website, YearStarted from Account"
    
    
    
    public init(json: JSON) {
        super.init(objectType: SObjectType.Account, json: json)
        
        AccountNumber = json["AccountNumber"].stringValue
        AccountSource = json["AccountSource"].stringValue
        AnnualRevenue = json["AnnualRevenue"].doubleValue
        BillingAddress?.street = json["BillingAddress"]["street"].stringValue
        BillingAddress?.city = json["BillingAddress"]["city"].stringValue
        BillingAddress?.state = json["BillingAddress"]["state"].stringValue
        BillingAddress?.zip = json["BillingAddress"]["stateCode"].stringValue
        BillingAddress?.longitude = json["BillingAddress"]["longitude"].doubleValue
        BillingAddress?.latitude = json["BillingAddress"]["latitude"].doubleValue
        ShippingAddress?.street = json["ShippingAddress"]["street"].stringValue
        ShippingAddress?.city = json["ShippingAddress"]["city"].stringValue
        ShippingAddress?.state = json["ShippingAddress"]["state"].stringValue
        ShippingAddress?.zip = json["ShippingAddress"]["stateCode"].stringValue
        ShippingAddress?.longitude = json["ShippingAddress"]["longitude"].doubleValue
        ShippingAddress?.latitude = json["ShippingAddress"]["latitude"].doubleValue
        CleanStatus = json["CleanStatus"].stringValue
        DandbCompanyId = json["DandbCompanyId"].stringValue
        Description = json["Description"].stringValue
        DunsNumber = json["DunsNumber"].stringValue
        Fax = json["Fax"].stringValue
        Industry = json["Industry"].stringValue
        Jigsaw = json["Jigsaw"].stringValue
        JigsawCompanyId = json["JigsawCompanyId"].stringValue
        LastActivityDate = json["LastActivityDate"].systemdate
        LastReferencedDate = json["LastReferencedDate"].systemdate
        LastViewedDate = json["LastViewedDate"].systemdate
        MasterRecordId = json["MasterRecordId"].stringValue
        NaicsCode = json["NaicsCode"].stringValue
        NaicsDesc = json["NaicsDesc"].stringValue
        Name = json["Name"].stringValue
        NumberOfEmployees = json["NumberOfEmployees"].intValue
        Ownership = json["Ownership"].stringValue
        ParentId = json["ParentId"].stringValue
        Phone = json["Phone"].stringValue
        Rating = json["Rating"].stringValue
        Sic = json["Sic"].stringValue
        SicDesc = json["SicDesc"].stringValue
        TickerSymbol = json["TickerSymbol"].stringValue
        Tradestyle = json["Tradestyle"].stringValue
        PhotoUrl = NSURL(string: json["PhotoUrl"].stringValue)
        Website = NSURL(string: json["Website"].stringValue)
        
    }
    
}


