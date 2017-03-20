//
//  Account.swift
//  https://developer.salesforce.com/docs/atlas.en-us.api.meta/api/sforce_api_objects_account.htm
//
//  Created by Quinton Wall on 11/19/16.
//
//

import Foundation
import SwiftyJSON



open class Account : SObject  {
    
    
    
    open var AccountNumber : String?
    open var AccountSource : String?
    open var AnnualRevenue : Double = 0.0
    open var BillingAddress : Address = Address()
    open var CleanStatus : String?
    open var DandbCompanyId : String?
    open var Description : String?
    open var DunsNumber : String?
    open var Fax : String?
    open var Industry : String?
    open var Jigsaw : String?
    open var JigsawCompanyId : String?
    open var LastActivityDate : Date?
    open var LastReferencedDate : Date?
    open var LastViewedDate : Date?
    open var MasterRecordId : String?
    open var NaicsCode : String?
    open var NaicsDesc : String?
    open var Name : String?
    open var NumberOfEmployees : Int?
    open var Ownership : String?
    open var ParentId : String?
    open var Phone : String?
    /// Description: only returns a relative URL. You need to add your instance name to it, and store it in PhotoFullURL
    open var PhotoRelativeUrl : String?
    open var PhotoFullUrl : URL?
    open var Rating : String?
    open var ShippingAddress : Address = Address()
    open var Sic : String?
    open var SicDesc : String?
    open var TickerSymbol : String?
    open var Tradestyle : String?
    open var Website : URL?
    open var YearStarted : String?
    
    /// Description: stores related opportunities. This is not populated in init (through results payload). Dev must store themselves.
    open var opportunities : [Opportunity] = []
     /// Description: stores related opportunities. This is not populated in init (through results payload). Dev must store themselves.
    open var contacts : [Contact] = []
  

    
    override open class func populateToCollection(_ records : NSArray)  -> [SObject] {
        var allrecords : [Account] = []
        
        let j = JSON(records)
        for (_, subJson) in j {
            allrecords.append(Account(json: subJson))
        }
        
        return allrecords
    
    }
    
    override open class func soqlGetAllFields(_ id: String?)  -> String {
       
        return configSOQLStatement(id, soqlbase: "select AccountNumber, AccountSource, AnnualRevenue, BillingAddress, BillingGeocodeAccuracy, CleanStatus, CreatedById, CreatedDate,  DandbCompanyId, Description, DunsNumber, Fax, Id, Industry, IsDeleted, Jigsaw, JigsawCompanyId, LastActivityDate, LastModifiedById, LastModifiedDate, LastReferencedDate, LastViewedDate, MasterRecordId, NaicsCode, NaicsDesc, Name, NumberOfEmployees,  OwnerId, Ownership, ParentId, Phone, PhotoUrl, Rating, ShippingAddress, ShippingGeocodeAccuracy, Sic, SicDesc, Site, SystemModstamp, TickerSymbol, Tradestyle, Type, Website, YearStarted from Account")
    }

    
    public init(id: String) {
        super.init(id: id, objectType: SObjectType.Account)
    }
    
    public init(json: JSON) {
        super.init(objectType: SObjectType.Account, json: json)
        
        Name = json["Name"].stringValue
        AccountNumber = json["AccountNumber"].stringValue
        AccountSource = json["AccountSource"].stringValue
        AnnualRevenue = json["AnnualRevenue"].doubleValue
        BillingAddress.street = json["BillingAddress"]["street"].stringValue
        BillingAddress.city = json["BillingAddress"]["city"].stringValue
        BillingAddress.state = json["BillingAddress"]["state"].stringValue
        BillingAddress.stateCode = json["BillingAddress"]["stateCode"].stringValue
        BillingAddress.zip = json["BillingAddress"]["postalCode"].stringValue
        BillingAddress.longitude = json["BillingAddress"]["longitude"].doubleValue
        BillingAddress.latitude = json["BillingAddress"]["latitude"].doubleValue
        ShippingAddress.street = json["ShippingAddress"]["street"].stringValue
        ShippingAddress.city = json["ShippingAddress"]["city"].stringValue
        ShippingAddress.state = json["ShippingAddress"]["state"].stringValue
        ShippingAddress.stateCode = json["ShippingAddress"]["stateCode"].stringValue
        ShippingAddress.zip = json["ShippingAddress"]["postalCode"].stringValue
        ShippingAddress.longitude = json["ShippingAddress"]["longitude"].doubleValue
        ShippingAddress.latitude = json["ShippingAddress"]["latitude"].doubleValue
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
        NumberOfEmployees = json["NumberOfEmployees"].intValue
        Ownership = json["Ownership"].stringValue
        ParentId = json["ParentId"].stringValue
        Phone = json["Phone"].stringValue
        Rating = json["Rating"].stringValue
        Sic = json["Sic"].stringValue
        SicDesc = json["SicDesc"].stringValue
        TickerSymbol = json["TickerSymbol"].stringValue
        Tradestyle = json["Tradestyle"].stringValue
        
        //photo url is only stored as a relative url in salesforce. eg: /services/images/photo/0013600000q8rb0AAA
        //you need to retrieve the hostname from your SDK that you are using to connect to salesforce.
        //for convenience, you can store the full URL in PhotoFullURL
        PhotoRelativeUrl = json["PhotoUrl"].stringValue
        Website = URL(string: json["Website"].stringValue)
        
    }
    
}


