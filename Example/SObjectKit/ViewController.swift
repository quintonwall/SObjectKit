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
        loginButton.layer.borderColor = UIColor.lightGray.cgColor
        loginButton.layer.cornerRadius = 5.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginTapped(_ sender: AnyObject) {
        showLogMeInScreen()
    }
    
    fileprivate func showLogMeInScreen() {
        
        firstly {
            salesforce.identity()
            
            }.then {_ in
                self.dismiss(animated: true, completion: {
                   print("dismissing")
                self.performSegue(withIdentifier: "accounts", sender: self)
                })
            }.catch { error in
                let fcdialog = FCAlertView()
                
                fcdialog.showAlert(inView: self, withTitle: "Kaboom!", withSubtitle: "Something gone bust.", withCustomImage: UIImage(named: "close-x"), withDoneButtonTitle: "OK", andButtons: nil)
                fcdialog.colorScheme = fcdialog.flatGreen
                fcdialog.dismissOnOutsideTouch = true
        }
        
        
    }

}

