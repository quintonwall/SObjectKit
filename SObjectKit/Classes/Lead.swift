//
//  Lead.swift
//  Pods
//
//  Created by QUINTON WALL on 12/6/16.
//
//

import Foundation
import SwiftyJSON

public final class Lead : SObject  {
    
    public var LeadAddress : Address = Address()
    public var AnnualRevenue : Double?
    public var CleanStatus : String?
    public var Company : String?
    public var CompanyDunsNumber : String?
    public var ConvertedAccountId : String?
    public var ConvertedContactId : String?
    public var ConvertedDate : Date?
    public var ConvertedOpportunityId : String?
    public var DandbCompanyId : String?
    public var Description : String?
    public var Email : String?
    public var EmailBouncedDate : Date?
    public var EmailBouncedReason : String?
    public var Fax : String?
    public var FirstName : String?
    public var Industry : String?
    public var IsConverted : Bool?
    public var IsDeleted : Bool?
    public var IsUnreadByOwner : Bool?
    public var Jigsaw : String?
    public var JigsawContactId : String?
    public var LastActivityDate : Date?
    public var LastName : String?
    public var LastReferencedDate : Date?
    public var LastViewedDate : Date?
    public var LeadSource : String?
    public var MasterRecordId : String?
    public var MobilePhone : String?
    public var Name : String?
    public var NumberOfEmployees : Int?
    public var OwnerId : String?
    public var Phone : String?
    //only returns a relative URL. You need to add your instance name to it, and store it in PhotoFullURL
    public var PhotoUrl : String?
    public var PhotoFullUrl : URL?
    public var Rating : String?
    public var Salutation : String?
    public var Status : String?
    public var Title : String?
    public var Website : URL?
    
    
      override public class func populateToCollection(_ records : NSArray)  -> [SObject] {
        var allrecords : [Lead] = []
        
        let j = JSON(records)
        for (_, subJson) in j {
            allrecords.append(Lead(json: subJson))
        }
        
        return allrecords
        
    }
    
    override public class func soqlGetAllFields(_ id: String?)  -> String {
        
       return configSOQLStatement(id, soqlbase: "select Address, AnnualRevenue, CleanStatus, Company, CompanyDunsNumber, ConvertedAccountId, ConvertedContactId, ConvertedDate, ConvertedOpportunityId, CreatedById, CreatedDate, DandbCompanyId, Description, Email, EmailBouncedDate, EmailBouncedReason, Fax, FirstName, GeocodeAccuracy, Id, Industry, IsConverted, IsDeleted, IsUnreadByOwner, Jigsaw, JigsawContactId, LastActivityDate, LastModifiedById, LastModifiedDate, LastName, LastReferencedDate, LastViewedDate, LeadSource, MasterRecordId, MobilePhone, Name, NumberOfEmployees, OwnerId, Phone, PhotoUrl,Rating, Salutation,  Status, SystemModstamp, Title, Website from Lead")
    }
    
    
    public init(json: JSON) {
        super.init(objectType: SObjectType.Lead, json: json)
        
        LeadAddress.street = json["Address"]["street"].stringValue
        LeadAddress.city = json["Address"]["city"].stringValue
        LeadAddress.state = json["Address"]["state"].stringValue
        LeadAddress.zip = json["Address"]["stateCode"].stringValue
        LeadAddress.zip = json["Address"]["postalCode"].stringValue
        LeadAddress.longitude = json["Address"]["longitude"].doubleValue
        LeadAddress.latitude = json["Address"]["latitude"].doubleValue
        AnnualRevenue = json["AnnualRevenue"].doubleValue
        CleanStatus = json["CleanStatus"].stringValue
        Company = json["Company"].stringValue
        CompanyDunsNumber = json["CompanyDunsNumber"].stringValue
        ConvertedAccountId = json["ConvertedAccountId"].stringValue
        ConvertedContactId = json["ConvertedContactId"].stringValue
        ConvertedOpportunityId = json["ConvertedOpportunityId"].stringValue
        DandbCompanyId = json["DandbCompanyId"].stringValue
        Description = json["Description"].stringValue
        Email = json["Email"].stringValue
        EmailBouncedDate = json["EmailBouncedDate"].date
        EmailBouncedReason = json["EmailBouncedReason"].stringValue
        Fax = json["Fax"].stringValue
        FirstName = json["FirstName"].stringValue
        Industry = json["Industry"].stringValue
        IsConverted = json["IsConverted"].boolValue
        IsDeleted = json["IsDeleted"].boolValue
        IsUnreadByOwner = json["IsUnreadByOwner"].boolValue
        Jigsaw = json["Jigsaw"].stringValue
        JigsawContactId = json["JigsawContactId"].stringValue
        LastActivityDate = json["LastActivityDate"].date
        LastName = json["LastName"].stringValue
        LastReferencedDate = json["LastReferencedDate"].date
        LastViewedDate = json["LastViewedDate"].date
        LeadSource = json["LeadSource"].stringValue
        MasterRecordId = json["MasterRecordId"].stringValue
        MobilePhone = json["MobilePhone"].stringValue
        Name = json["Name"].stringValue
        NumberOfEmployees = json["NumberOfEmployees"].int
        OwnerId = json["OwnerId"].stringValue
        Phone = json["Phone"].stringValue
        PhotoUrl = json["PhotoUrl"].stringValue
        Rating = json["Rating"].stringValue
        Salutation = json["Salutation"].stringValue
        Status = json["Status"].stringValue
        Title = json["Title"].stringValue
        Website = json["Website"].url
    }

}
