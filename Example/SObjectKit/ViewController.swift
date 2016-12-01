//
//  ViewController.swift
//  qtilities
//
//  Created by Quinton Wall on 11/19/2016.
//  Copyright (c) 2016 Quinton Wall. All rights reserved.
//

import UIKit
import SwiftlySalesforce
import FCAlertView
import PromiseKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginButton.layer.borderWidth = 1.0
        loginButton.layer.borderColor = UIColor.blueColor().CGColor
        loginButton.layer.cornerRadius = 5.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginTapped(sender: AnyObject) {
        showLogMeInScreen()
    }
    
    private func showLogMeInScreen() {
        
        firstly {
            SalesforceAPI.Identity.request()
            
            }.then {_ in
                self.dismissViewControllerAnimated(true, completion: {
                   print("dismissing")
                    
                })
            }.then { _ in
                self.performSegueWithIdentifier("accounts", sender: self)
            }.error { _ in
                let fcdialog = FCAlertView()
                fcdialog.showAlertInView(self, withTitle: "Kaboom!", withSubtitle: "Something gone bust.", withCustomImage: UIImage(named: "close-x"), withDoneButtonTitle: "OK", andButtons: nil)
                fcdialog.colorScheme = fcdialog.flatGreen
                fcdialog.dismissOnOutsideTouch = true
        }
        
        
    }

}

