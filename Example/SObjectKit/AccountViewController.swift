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
        refreshControl?.addTarget(self, action: #selector(AccountViewController.handleRefresh), for: UIControlEvents.valueChanged)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        //register the qtilities default account cell
        //let bundle = NSBundle(forClass: self.dynamicType)
       // tableView.registerNib(UINib(nibName: "AccountTableCellView", bundle: NSBundle(forClass: AccountTableCellView.self)), forCellReuseIdentifier: "accountcell")

      loadData()
        
    }
    
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
                let fcdialog = FCAlertView()
                fcdialog.showAlert(inView: self, withTitle: "Kaboom!", withSubtitle: "Something gone bust.", withCustomImage: UIImage(named: "close-x"), withDoneButtonTitle: "OK", andButtons: nil)
                fcdialog.colorScheme = fcdialog.flatGreen
                fcdialog.dismissOnOutsideTouch = true
        }
    }

      func handleRefresh(_ refreshControl: UIRefreshControl) {
        loadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "accountcell", for: indexPath) as! AccountTableCell
        cell.bind(allAccounts[indexPath.item])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.allAccounts.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! AccountTableCell
        selectedAccount = cell.account
        performSegue(withIdentifier: "OpportunitiesForAccount", sender: self)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OpportunitiesForAccount" {
            let navController = segue.destination as! UINavigationController
            let destVC = navController.topViewController as! OpportunityTableViewController
            destVC.parentAccount = self.selectedAccount
        }
    }
}


