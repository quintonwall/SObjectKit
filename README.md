# SObjectKit

[![CI Status](http://img.shields.io/travis/quintonwall/SObjectKit.svg?style=flat)](https://travis-ci.org/quintonwall/SObjectKit)
[![Version](https://img.shields.io/cocoapods/v/SObjectKit.svg?style=flat)](http://cocoapods.org/pods/SObjectKit)
[![License](https://img.shields.io/cocoapods/l/SObjectKit.svg?style=flat)](http://cocoapods.org/pods/SObjectKit)
[![Platform](https://img.shields.io/cocoapods/p/SObjectKit.svg?style=flat)](http://cocoapods.org/pods/SObjectKit)

SObjectKit a collection of helpful utility classes and functions for working with Salesforce data types and data objects (SObjects). 

SObjectKit is not intended to be a complete OO / relational model of Salesforce's data structure, rather it is intended to solve for the 80% use case where a developer who doesn't know Salesforce APIs or SOQL wants to fetch and bind data. This generally models the Salesforce REST API approach which does not return all related records of an object, rather it returns the id of related records. I'm also looking at making the SObjects [Realm](https://realm.io) compliant to make offline data storage super easy. 

SObjectKit will also be bundled as a companion to [SalesforceViews](https://github.com/quintonwall/SalesforceViews), which will provide a collection of ready-to-go UIViews, as Xib files, you will be able to register with your app.

The Big 6 (Account, Opportunity, OpportunityLineItem, Lead, Contact, Case) will be implemented in the initial version, with other standard objects added over time as needed, or contributed by the community.

The following objects have currently been implemented:
 * Account
 * Opportunity
 * Lead

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
    SalesforceAPI.Query(soql: Account.soqlGetAllStandardFields(nil)).request()

  }.then {
   ( result) -> () in
     self.allAccounts = Account.populateToCollection(result["records"] as! NSArray) as! [Account]
  }.always {
     self.tableView.reloadData()
     self.refreshControl?.endRefreshing()

  }.error { _ in
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
    account.PhotoFullUrl = NSURL(string: "https://"+OAuth2Manager.sharedInstance.hostname+account.PhotoRelativeUrl!+"?oauth_token="+(OAuth2Manager.sharedInstance.credentials?.accessToken)!)
    accountPhoto.sd_setImageWithURL(account.PhotoFullUrl, placeholderImage: UIImage(named: "account-placeholder"))


   //longitude and latitude values will only be auto added to standard address fields in salesforce if you
   // enable them in your org via Setup > Feature Settings > Data.com > Clean Rules.
   propertyLocation = CLLocation(latitude: account.BillingAddress.latitude, longitude: account.BillingAddress.longitude)
   centerMapOnLocation(propertyLocation!)
}

```

## Querying Data
By default, SObjectKit is configured with SOQL statements to fetch all standard fields. (I will add an example for custom fields via an extension to a standard object shortly) You have three options to fetch standard fields: 

### Fetch all fields for an sobject type
```swift
 let soqlstmt = Opportunity.soqlGetAllStandardFields(nil)
```

### Fetch all fields for a specific record
```swift
 let soqlstmt = Opportunity.soqlGetAllStandardFields(recordId)

```

### write your own query with just the fields you want
```swift
  //Using SwiftlySalesforce to handle comms with Salesforce
   SalesforceAPI.Query(soql: "Select Id, Name, NextStep From Opportunity").request()
```




## Author

[Quinton Wall](https://twitter.com/quintonwall)

## License

SObjectKit is available under the MIT license. See the LICENSE file for more info.
