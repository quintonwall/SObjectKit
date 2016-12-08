//
//  AppDelegate.swift
//  SObjectKit
//
//  Created by quintonwall on 12/01/2016.
//  Copyright (c) 2016 quintonwall. All rights reserved.
//

import UIKit
import SwiftlySalesforce

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, LoginViewPresentable {

    var window: UIWindow?
    
    //You will need to create your own connected app by following the instructions here:
    // https://help.salesforce.com/articleView?id=connected_app_create.htm
    let consumerKey = "ADD-YOUR-CONSUMER-KEY-HERE"
    //eg: sobjectkit://success
    let redirectURL = NSURL(string: "sobjectkit://success")!
    //eg: na30.lightning.force.com
    let hostname = "naXX.lightning.force.com"


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        OAuth2Manager.sharedInstance.configureWithConsumerKey(consumerKey, redirectURL: redirectURL, hostname: hostname)
        OAuth2Manager.sharedInstance.authenticationDelegate = self

        return true
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        handleRedirectURL(url)
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

