//
//  SObject.swift
//  Pods

// Full list of objects here: https://resources.docs.salesforce.com/sfdc/pdf/object_reference.pdf
//
//  Created by Quinton Wall on 11/19/16.
//
//

import SwiftyJSON


open class SObject : NSObject {
    
    
    //update this each time we update the sobjects
    open static let salesforceAPIVersion : String = "37.0"
    
    open var id: String?
    open var isDeleted: Bool?
    open var createdById: String?
    open var createdDate : Date?
    open var lastModifiedById: String?
    open var lastModifiedDate : Date?
    open var type: String?
    
    
    
    
    public init(objectType: String, json: JSON) {
        type =  objectType
        id = json["Id"].stringValue
        isDeleted = json["IsDeleted"].boolValue
        createdById = json["CreatedById"].stringValue
        createdDate = json["CreatedDate"].systemdate
        lastModifiedById = json["lastModifiedById"].stringValue
        lastModifiedDate = json["CreatedDate"].systemdate
       
    }
    
    public init(id: String, objectType: String) {
        type =  objectType
        self.id = id
    }
    
    
    open class func populateToCollection(_ records : NSArray) -> [SObject] {
        preconditionFailure("This method has not been overridden by SObject implementation.")
        
    }
    
    /* leave id as nil for all  records
     * Sample implementation: 
     *  var soql = "select AccountId, ....,  Amount from Opportunity"
     
        if (id ?? "").isEmpty {
          return soql
        } else {
          return "\(soql) where id = '\(id)'"
        }
    */
    open class func soqlGetAllFields(_ id: String?) -> String {
        preconditionFailure("This method has not been overridden by SObject implementation.")
        
    }
    
  
     internal class func configSOQLStatement(_ id: String?, soqlbase: String) -> String {
    
        var customfields : String = ""
        
        if self is CustomSObject.Type {
            let className = NSStringFromClass(self as AnyClass)
            let aClass = NSClassFromString(className) as! CustomSObject.Type
            customfields = ", "+aClass.customFieldNames().joined(separator: ",")
        }
        
        let finalsoql = soqlbase.insert(customfields, ind: soqlbase.indexOf(" from"))
        
        if (id ?? "").isEmpty {
            return finalsoql
        } else {
            return "\(finalsoql) where id = '\(String(describing: id))'"
        }
        
    }
    
    
}



struct SObjectType {
    static var Account           : String =  "001"
    static var AccountContactRole  : String =  "02Z"
    static var AccountShare   : String =  "00r"
    static var AdditionalNumber  : String =  "04m"
    static var ApexClass       : String =  "01p"
    static var ApexPage       : String =  "066"
    static var ApexTrigger       : String =  "01q"
    static var Approval       : String =  "806"
    static var Asset           : String =  "02i"
    static var Attachment       : String =  "00P"
    static var BrandTemplate   : String =  "016"
    static var BusinessHours   : String =  "01m"
    static var BusinessProcess   : String =  "019"
    static var CallCenter       : String =  "04v"
    static var Campaign       : String =  "701"
    static var CampaignMember   : String =  "00v"
    static var CampaignMemberStatus : String =  "01Y"
    static var CampaignShare   : String =  "08s"
    static var Case           : String =  "500"
    static var CaseComment       : String =  "00a"
    static var CaseContactRole   : String =  "03j"
    static var CaseShare       : String =  "01n"
    static var CaseSolution   : String =  "010"
    static var CategoryData   : String =  "02o"
    static var CategoryNode   : String =  "02n"
    static var Contact           : String =  "003"
    static var ContactShare   : String =  "03s"
    static var Contract       : String =  "800"
    static var ContractContactRole  : String =  "02a"
    static var Document       : String =  "015"
    static var DocumentAttachmentMap  : String =  "05X"
    static var EmailStatus       : String =  "018"
    static var EmailTemplate   : String =  "00X"
    static var Event           : String =  "00U"
    static var EventAttendee   : String =  "020"
    static var FiscalYearSettings  : String =  "022"
    static var Folder           : String =  "00l"
    static var ForecastShare   : String =  "608"
    static var Group           : String =  "00G"
    static var GroupMember       : String =  "011"
    static var Lead           : String =  "00Q"
    static var LeadShare       : String =  "01o"
    static var MailmergeTemplate  : String =  "01H"
    static var Note           : String =  "002"
    static var Opportunity       : String =  "006"
    static var OpportunityCompetitor   : String =  "00J"
    static var OpportunityContactRole   : String =  "00K"
    static var OpportunityHistory  : String =  "008"
    static var OpportunityLineItem  : String =  "00k"
    static var OpportunityShare  : String =  "00t"
    static var Organization   : String =  "00D"
    static var Partner           : String =  "00I"
    static var Period           : String =  "026"
    static var Pricebook2       : String =  "01s"
    static var PricebookEntry   : String =  "01u"
    static var ProcessInstance   : String =  "04g"
    static var ProcessInstanceStep  : String =  "04h"
    static var ProcessInstanceWorkitem   : String =  "04i"
    static var Product2       : String =  "01t"
    static var Profile           : String =  "00e"
    static var QueueSobject   : String =  "03g"
    static var RecordType       : String =  "012"
    static var Scontrol       : String =  "01N"
    static var SelfServiceUser   : String =  "035"
    static var Solution       : String =  "501"
    static var StaticResource   : String =  "081"
    static var Task           : String =  "00T"
    static var User           : String =  "005"
    static var UserLicense       : String =  "100"
    static var UserPreference   : String =  "03u"
    static var UserRole       : String =  "00E"
    static var WebLink           : String =  "00b"
}
