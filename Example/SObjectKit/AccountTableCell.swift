//
//  AccountTableCell.swift
//  Basic example of how you can use the SObjectKit libraries to quickly work with Salesforce objects and fields
//  Obviously I didn't spend much time making it look pretty :)
//
//  Created by QUINTON WALL on 12/1/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import SObjectKit
import MapKit
import SDWebImage
import SwiftlySalesforce


public class AccountTableCell : UITableViewCell, MKMapViewDelegate {
    
    public var account : Account!
    
    @IBOutlet weak var lastUpdatedLabel: UILabel!
    @IBOutlet weak var billingMap: MKMapView!
    @IBOutlet weak var tickerSymbolLabel: UILabel!
    @IBOutlet weak var accountNameLabel: UILabel!
    
    @IBOutlet weak var accountPhoto: UIImageView!
    
    let regionRadius: CLLocationDistance = 300
    var propertyLocation : CLLocation?
    let locationManger:CLLocationManager = CLLocationManager()
    
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
    
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        
        if let billingMap = self.billingMap
        {
            billingMap.delegate = self
        }
       
        
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,regionRadius * 2.0, regionRadius * 2.0)
        let objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = location.coordinate
        objectAnnotation.title = account?.Name
        self.billingMap.addAnnotation(objectAnnotation)
        
        billingMap.setRegion(coordinateRegion, animated: true)
    }
}