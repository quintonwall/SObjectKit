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


open class OpportunityTableCell : UITableViewCell {
    
    fileprivate var opty : Opportunity!
    
    @IBOutlet weak var optyIdLabel: UILabel!
    @IBOutlet weak var optyNameLabel: UILabel!
    
    
    open func bind(_ sobject : Opportunity) {
        self.opty = sobject
        self.optyIdLabel.text = sobject.id
        self.optyNameLabel.text = sobject.Name
        
    }

}
