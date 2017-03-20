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
        
        refreshControl?.addTarget(self, action: #selector(OpportunityTableViewController.handleRefresh), for: UIControlEvents.valueChanged)
        
        loadData()
    }
    
   
    
    func handleRefresh(_ refreshControl: UIRefreshControl) {
        loadData()
    }
    
    func loadData() {
        
        var soqlstmt : String = ""
        if (parentAccount == nil) {
            soqlstmt = Opportunity.soqlGetAllFields(nil)
        } else {
            soqlstmt = Opportunity.soqlGetOpportunitiesForAccount(parentAccount!.id!)
        }
        
        firstly {
            salesforce.query(soql: soqlstmt)
        }.then {
            ( result) -> () in
                self.allOpportunities = Opportunity.populateToCollection(result.records as NSArray) as! [Opportunity]
                
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "opportunitycell", for: indexPath) as! OpportunityTableCell
        cell.bind(allOpportunities[indexPath.item])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.allOpportunities.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func closeOpty(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: {})
    }


}

