//
//  OpportunityTableCell.swift
//  SObjectKit
//
//  Created by QUINTON WALL on 12/6/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import SObjectKit
import SwiftlySalesforce


public class OpportunityTableCell : UITableViewCell {
    
    private var opty : Opportunity!
    
    @IBOutlet weak var optyIdLabel: UILabel!
    @IBOutlet weak var optyNameLabel: UILabel!
    
    
    public func bind(sobject : Opportunity) {
        self.opty = sobject
        self.optyIdLabel.text = sobject.id
        self.optyNameLabel.text = sobject.Name
        
    }

}
