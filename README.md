# SObjectKit

[![Version](https://img.shields.io/cocoapods/v/SObjectKit.svg?style=flat)](http://cocoapods.org/pods/SObjectKit)
[![License](https://img.shields.io/cocoapods/l/SObjectKit.svg?style=flat)](http://cocoapods.org/pods/SObjectKit)
[![Platform](https://img.shields.io/cocoapods/p/SObjectKit.svg?style=flat)](http://cocoapods.org/pods/SObjectKit)

SObjectKit a collection of helpful utility classes and functions for working with Salesforce data types and data objects (SObjects). 

SObjectKit is not intended to be a complete OO / relational model of Salesforce's data structure, rather it is intended to solve for the 80% use case where a developer who doesn't know Salesforce APIs or SOQL wants to fetch and bind data. This generally models the Salesforce REST API approach which does not return all related records of an object, rather it returns the id of related records, which you can use to fetch related data and store on the specific objects collection variables.  I'm also looking at making the SObjects [Realm](https://realm.io) compliant to make offline data storage super easy. Currently SObjectKit is read-only. 

SObjectKit will also be bundled as a companion to [SalesforceViews](https://github.com/quintonwall/SalesforceViews), which will provide a collection of ready-to-go UIViews, as Xib files, you will be able to register with your app.

The following standard objects have been implemented:
 * Account
 * Opportunity
 * OpporuntityLineItems
 * Lead
 * Contact
 * Product2 
 * PricebookEntry

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SObjectKit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SObjectKit"
```

## Usage

SObjectKit provides implementations of all the Standard Salesforce Objects (SObjects). It does not provide any communication or authentication to Salesforce. It is up to the developer to choose which SDK they prefer. Many developers use the [Salesforce Mobile SDK](https://github.com/forcedotcom/SalesforceMobileSDK-iOS), the official SDK provided by Salesforce. I'm also a fan of [SwiftlySalesforce](https://github.com/mike4aday/SwiftlySalesforce) because of its use of [Promises](http://promisekit.org). They make async calls much more elegant. Because of this reason, the sample app included with the pod uses SwiftlySalesforce. 

### Example: Fetch data and load into a table cell
```swift
func loadData() {

  firstly {
    salesforce.query(soql: Account.soqlGetAllFields(nil))

  }.then {
   ( result) -> () in
     self.allAccounts = Account.populateToCollection(result.records as NSArray) as! [Account]
  }.always {
     self.tableView.reloadData()
     self.refreshControl?.endRefreshing()

  }.catch { error in
    //do some error handling
  }
}

override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
   let cell = tableView.dequeueReusableCellWithIdentifier("accountcell", forIndexPath: indexPath) as! AccountTableCell
   cell.bind(allAccounts[indexPath.item])
   return cell
}

```

### Example: Working with SObjects
```swift

 public func bind(account : Account) {

    self.account = account
    accountNameLabel.text = account.Name
    tickerSymbolLabel.text = account.TickerSymbol

    //Using an SObjectKit extension on String to make date formatting easier
    lastUpdatedLabel.text = account.lastModifiedDate?.toShortPrettyString()

    OAuth2Manager.sharedInstance.credentials?.accessToken

    //photo url, obtained by connecting social accounts in your org, is only stored as a relative url in salesforce. eg: /services/images/photo/0013600000q8rb0AAA
    //you need to retrieve the hostname from your SDK that you are using to connect to salesforce, and append the accessToken...messy I know!

    //In this sample app, I am using SwiftlySalesforce and then storing it on my account object for convenience

 account.PhotoFullUrl = URL(string: "https://"+salesforce.authManager.configuration.loginHost+account.PhotoRelativeUrl!)?.protectedSalesforceURL((salesforce.authManager.authData?.accessToken)!)

    accountPhoto.sd_setImageWithURL(account.PhotoFullUrl, placeholderImage: UIImage(named: "account-placeholder"))


   //longitude and latitude values will only be auto added to standard address fields in salesforce if you
   // enable them in your org via Setup > Feature Settings > Data.com > Clean Rules.
   propertyLocation = CLLocation(latitude: account.BillingAddress.latitude, longitude: account.BillingAddress.longitude)
   centerMapOnLocation(propertyLocation!)
}

```

### Related Objects
The Saleforce REST API doesn't fetch related children records (of course, you can write your own SOQL to do this). SObjectKit models this approach, but provides convenient collection variables on SObject types. Developers can use these collections to easily manage related data once fetched from Salesforce.
```swift
firstly {
   salesforce.query(soql: Opportunity.soqlGetOpportunitiesForAccount(accountid))

}.then {
  ( result) -> () in
     self.account.opportunities = Opportunity.populateToCollection(result.records as NSArray) as! [Opportunity]
}.always {
 //do something
}.catch { error in
//do some error handling
}

```

## Querying Data
By default, SObjectKit is configured with SOQL statements to fetch all standard fields. (I will add an example for custom fields via an extension to a standard object shortly) You have three options to fetch standard fields: 

### Fetch all fields for an sobject type
```swift
 let soqlstmt = Opportunity.soqlGetAllFields(nil)
```

### Fetch all fields for a specific record
```swift
 let soqlstmt = Opportunity.soqlGetAllFields(recordId)

```

### write your own query with just the fields you want
```swift
  //Using SwiftlySalesforce to handle comms with Salesforce
   salesforce.query(soql: "Select Id, Name, NextStep From Opportunity")
```

## Handling Custom Fields on a Standard Object
Custom fields can be supported by creating a new class which implements the CustomSObject protocol and overriding the customFieldNames() func, plus implementing the init func to map JSON results to fields. In addition, it is recommended to override the populateToCollection func to make it easier for use in your downstream code. 

Whilst this may seem like additional effort (vs. simply providing a func to pass in custom field names), this approach provides convenient mapping to strongly typed objects. (this is the whole point of SObjectKit, after all) which saves significant development time by limiting proliferation of field names throughout your code, and duplicate code to handle parsing json in multiple places.

The example app includes an AccountCustomSObject which provides support for 2 custom fields on the Account object. 

```swift
import Foundation
import SObjectKit
import SwiftyJSON

class AccountCustomSObject : Account, CustomSObject {

  var GlassdoorRating : Int?
  var IsNonProfit : Bool?


  override init(json: JSON) {
    super.init(json: json)

    let fieldnames = AccountCustomSObject.customFieldNames()
    GlassdoorRating = json[fieldnames[0]].int
    IsNonProfit = json[fieldnames[1]].boolValue
  }

  // Description: customsobject protocol requires you to implement this method
  static func customFieldNames() -> [String] {
    return ["GlassdoorRating__c, IsNonProfit__c"]
  }

  //
  // Description: This func is not required to be overridden for custom objects, but it makes it easier for downstream usage
  //
  override class func populateToCollection(records : NSArray)  -> [SObject] {
    var allrecords : [AccountCustomSObject] = []

    let j = JSON(records)
    for (_, subJson) in j {
       allrecords.append(AccountCustomSObject(json: subJson))
    }

    return allrecords
  }
}


```

SObjectKit will automatically include your custom fields in the soqlGetAllFields func calls to make it super easy to perform the equivalet of a 'select *' statement. The following snippet will retrieve both the custom fields defined in AccountCustomObject and all standard fields defined on Account
```swift
 salesforce.query(soql: AccountCustomObject.soqlGetAllFields(nil))
```


## Implementing Custom Objects
Implementing custom objects can be supported by creating a new SObject class. Refer to Account as solid example on what you need to implement.



## Working with Extensions
A number of extensions are included in SObjectKit to make it even easier to work with Salesforce data. The following two functions are likely to be used the most. Check out the API docs for more examples.

### Salesforce data format
Salesforce uses RFC3339 format (yyyy-MM-dd'T'HH:mm:ss.S'Z') for system dates which are not typically what you want to display in your app. Most of the time you want something like MM/DD/YY
```swift
  createdDateLabel.text = account.createdDate.toShortPrettyString()
```
### Salesforce protected URLs
Some information in Salesforce, most notably photoURLs (which are returned as relative URLs), can be accessed via a direct URL and valid auth token. The following example demonstrates how you can uses SwiftlySalesforce and the NSURL extension to simplify calling protected URLs. Note: calling NSURL.protectedSalesforceURL on a non-HTTPS url will through an assertion failed error at runtime as all Salesforce protected URLs must be accessed via HTTPS.
```swift

account.PhotoFullUrl = NSURL(string: "https://"+OAuth2Manager.sharedInstance.hostname+account.PhotoRelativeUrl!)?.protectedSalesforceURL((OAuth2Manager.sharedInstance.credentials?.accessToken)!)

```

## Author

[Quinton Wall](https://twitter.com/quintonwall)

## License

SObjectKit is available under the MIT license. See the LICENSE file for more info.
