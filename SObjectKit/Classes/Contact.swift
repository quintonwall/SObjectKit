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
    
    
    
    override public class func populateToCollection(records : NSArray)  -> [SObject] {
        var allrecords : [Contact] = []
        
        let j = JSON(records)
        for (_, subJson) in j {
            allrecords.append(Contact(json: subJson))
        }
        
        return allrecords
        
    }
    
    override public class func soqlGetAllStandardFields(id: String?)  -> String {
        
        var soql = "select AccountId, AssistantName, AssistantPhone, Birthdate, CleanStatus, CreatedById, CreatedDate, Department, Description, Email, EmailBouncedDate, EmailBouncedReason, Fax, FirstName, HomePhone, Id, IsDeleted, IsEmailBounced, Jigsaw, JigsawContactId, LastActivityDate, LastCURequestDate, LastCUUpdateDate, LastModifiedById, LastModifiedDate, LastName, LastReferencedDate, LastViewedDate, LeadSource, MailingAddress, MailingGeocodeAccuracy, MasterRecordId, MobilePhone, Name, OtherAddress, OtherGeocodeAccuracy, OtherPhone, OwnerId, Phone, PhotoUrl, ReportsToId, Salutation, SystemModstamp, Title from Contact"
        
        if (id ?? "").isEmpty {
            return soql
        } else {
            return "\(soql) where id = '\(id)'"
        }
        
    }
    
    public class func soqlGetContactsForAccount(accountid: String) -> String {
        return self.soqlGetAllStandardFields(nil)+" where AccountId = '\(accountid)'"
    }
    
    
    public init(json: JSON) {
        super.init(objectType: SObjectType.Contact, json: json)
    }
    
}
