//
//  Contact.swift
//  Pods
//
//  Created by QUINTON WALL on 12/7/16.
//
//

import Foundation
import SwiftyJSON



public final class Contact : SObject  {
    
    public var AccountId : String?
    public var AssistantName : String?
    public var AssistantPhone : String?
    public var Birthdate : Date?
    public var CleanStatus : String?
    public var Department : String?
    public var Description : String?
    public var Email : String?
    public var EmailBouncedDate : Date?
    public var EmailBouncedReason : String?
    public var Fax : String?
    public var FirstName : String?
    public var HomePhone : String?
    public var IsDeleted : Bool?
    public var IsEmailBounced : Bool?
    public var Jigsaw : String?
    public var JigsawContactId : String?
    public var LastActivityDate : Date?
    public var LastCURequestDate : Date?
    public var LastCUUpdateDate : Date?
    public var LastName : String?
    public var LastReferencedDate : Date?
    public var LastViewedDate : Date?
    public var LeadSource : String?
    public var MailingAddress : Address = Address()
    public var MasterRecordId : String?
    public var MobilePhone : String?
    public var Name : String?
    public var OtherAddress : Address = Address()
    public var OtherPhone : String?
    public var OwnerId : String?
    public var Phone : String?
     /// Description: only returns a relative URL. You need to add your instance name to it, and store it in PhotoFullURL
    public var PhotoUrl : String?
    public var PhotoFullUrl : URL?
    public var ReportsToId : String?
    public var Salutation : String?
    public var Title : String?
    
    override public class func populateToCollection(_ records : NSArray)  -> [SObject] {
        var allrecords : [Contact] = []
        
        let j = JSON(records)
        for (_, subJson) in j {
            allrecords.append(Contact(json: subJson))
        }
        
        return allrecords
        
    }
    
    override public class func soqlGetAllFields(_ id: String?)  -> String {
        
        return configSOQLStatement(id, soqlbase: "select AccountId, AssistantName, AssistantPhone, Birthdate, CleanStatus, CreatedById, CreatedDate, Department, Description, Email, EmailBouncedDate, EmailBouncedReason, Fax, FirstName, HomePhone, Id, IsDeleted, IsEmailBounced, Jigsaw, JigsawContactId, LastActivityDate, LastCURequestDate, LastCUUpdateDate, LastModifiedById, LastModifiedDate, LastName, LastReferencedDate, LastViewedDate, LeadSource, MailingAddress, MailingGeocodeAccuracy, MasterRecordId, MobilePhone, Name, OtherAddress, OtherGeocodeAccuracy, OtherPhone, OwnerId, Phone, PhotoUrl, ReportsToId, Salutation, SystemModstamp, Title from Contact")        
    }
    
    public class func soqlGetContactsForAccount(_ accountid: String) -> String {
        return self.soqlGetAllFields(nil)+" where AccountId = '\(accountid)'"
    }
    
    public class func soqlGetContactsWhoReportTo(_ contactid: String) -> String {
        return self.soqlGetAllFields(nil)+" where ReportsToId = '\(contactid)'"
    }
    
    
    public init(json: JSON) {
        super.init(objectType: SObjectType.Contact, json: json)
        
        
         AccountId = json["AccountId"].stringValue
         AssistantName = json["AssistantName"].stringValue
         AssistantPhone = json["AssistantPhone"].stringValue
         Birthdate = json["Birthdate"].date
         CleanStatus = json["CleanStatus"].stringValue
        Department = json["Department"].stringValue
        Description = json["Description"].stringValue
        Email = json["Email"].stringValue
        EmailBouncedDate = json["EmailBouncedDate"].date
        EmailBouncedReason = json["EmailBouncedReason"].stringValue
        Fax = json["Fax"].stringValue
        FirstName = json["FirstName"].stringValue
        HomePhone = json["HomePhone"].stringValue
        IsDeleted = json["IsDeleted"].boolValue
        IsEmailBounced = json["IsEmailBounced"].boolValue
        Jigsaw = json["Jigsaw"].stringValue
        JigsawContactId = json["JigsawContactId"].stringValue
        LastActivityDate = json["LastActivityDate"].date
        LastCURequestDate = json["LastCURequestDate"].date
        LastName = json["LastName"].stringValue
        LastReferencedDate = json["LastReferencedDate"].date
        LastViewedDate = json["LastViewedDate"].date
        LeadSource = json["LeadSource"].stringValue
        MailingAddress.street = json["MailingAddress"]["street"].stringValue
        MailingAddress.city = json["MailingAddress"]["city"].stringValue
        MailingAddress.state = json["MailingAddress"]["state"].stringValue
        MailingAddress.stateCode = json["MailingAddress"]["stateCode"].stringValue
        MailingAddress.zip = json["MailingAddress"]["postalCode"].stringValue
        MailingAddress.longitude = json["MailingAddress"]["longitude"].doubleValue
        MailingAddress.latitude = json["MailingAddress"]["latitude"].doubleValue
        MasterRecordId = json["MasterRecordId"].stringValue
        MobilePhone = json["MobilePhone"].stringValue
        Name = json["Name"].stringValue
        OtherAddress.street = json["OtherAddress"]["street"].stringValue
        OtherAddress.city = json["OtherAddress"]["city"].stringValue
        OtherAddress.state = json["OtherAddress"]["state"].stringValue
        OtherAddress.stateCode = json["OtherAddress"]["stateCode"].stringValue
        OtherAddress.zip = json["OtherAddress"]["postalCode"].stringValue
        OtherAddress.longitude = json["OtherAddress"]["longitude"].doubleValue
        OtherAddress.latitude = json["OtherAddress"]["latitude"].doubleValue
        OtherPhone = json["OtherPhone"].stringValue
        OwnerId = json["OwnerId"].stringValue
        Phone = json["Phone"].stringValue
        PhotoUrl = json["PhotoUrl"].stringValue
        ReportsToId = json["ReportsToId"].stringValue
        Salutation = json["Salutation"].stringValue
        Title = json["Title"].stringValue
        
    }
    
}
