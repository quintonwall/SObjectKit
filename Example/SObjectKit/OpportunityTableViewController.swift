//
//  OpportunityTableViewController.swift
//  SObjectKit
//
//  Created by QUINTON WALL on 12/6/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import SwiftlySalesforce
import FCAlertView
import PromiseKit
import SObjectKit
import SwiftyJSON

class OpportunityTableViewController: UITableViewController {
    
    var parentAccount: Account?
    var allOpportunities : [Opportunity] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl?.addTarget(self, action: #selector(OpportunityTableViewController.handleRefresh), forControlEvents: UIControlEvents.ValueChanged)
        
        loadData()
    }
    
   
    
    func handleRefresh(refreshControl: UIRefreshControl) {
        loadData()
    }
    
    func loadData() {
        
        var soqlstmt : String = ""
        if (parentAccount == nil) {
            soqlstmt = Opportunity.soqlGetAllStandardFields(nil)
        } else {
            soqlstmt = Opportunity.soqlGetOpportunitiesForAccount(parentAccount!.id!)
        }
        
        firstly {
            SalesforceAPI.Query(soql: soqlstmt).request()
        }.then {
                ( result) -> () in
                self.allOpportunities = Opportunity.populateToCollection(result["records"] as! NSArray) as! [Opportunity]
                
            }.always {
                self.tableView.reloadData()
                self.refreshControl?.endRefreshing()
                
            }.error { _ in
                let fcdialog = FCAlertView()
                fcdialog.showAlertInView(self, withTitle: "Kaboom!", withSubtitle: "Something gone bust.", withCustomImage: UIImage(named: "close-x"), withDoneButtonTitle: "OK", andButtons: nil)
                fcdialog.colorScheme = fcdialog.flatGreen
                fcdialog.dismissOnOutsideTouch = true
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("opportunitycell", forIndexPath: indexPath) as! OpportunityTableCell
        cell.bind(allOpportunities[indexPath.item])
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.allOpportunities.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func closeOpty(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
    }


}

