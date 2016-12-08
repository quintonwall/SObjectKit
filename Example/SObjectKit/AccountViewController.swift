//
//  AccountViewController.swift
//  qtilities
//
//  Created by QUINTON WALL on 11/28/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import SwiftlySalesforce
import FCAlertView
import PromiseKit
import SObjectKit
import SwiftyJSON

class AccountViewController: UITableViewController {
    
     var allAccounts: [Account] = []
    var selectedAccount: Account?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl?.addTarget(self, action: #selector(AccountViewController.handleRefresh), forControlEvents: UIControlEvents.ValueChanged)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        //register the qtilities default account cell
        //let bundle = NSBundle(forClass: self.dynamicType)
       // tableView.registerNib(UINib(nibName: "AccountTableCellView", bundle: NSBundle(forClass: AccountTableCellView.self)), forCellReuseIdentifier: "accountcell")

      loadData()
        
    }
    
    func loadData() {
        
        
        
        firstly {
            SalesforceAPI.Query(soql: Account.soqlGetAllFields(nil)).request()
            
            }.then {
                ( result) -> () in
                self.allAccounts = Account.populateToCollection(result["records"] as! NSArray) as! [Account]
                
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

      func handleRefresh(refreshControl: UIRefreshControl) {
        loadData()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("accountcell", forIndexPath: indexPath) as! AccountTableCell
        cell.bind(allAccounts[indexPath.item])
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.allAccounts.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! AccountTableCell
        selectedAccount = cell.account
        performSegueWithIdentifier("OpportunitiesForAccount", sender: self)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "OpportunitiesForAccount" {
            let navController = segue.destinationViewController as! UINavigationController
            let destVC = navController.topViewController as! OpportunityTableViewController
            destVC.parentAccount = self.selectedAccount
        }
    }
}


