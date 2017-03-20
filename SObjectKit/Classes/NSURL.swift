//
//  NSURL.swift
//  DHNative
//
//  Created by QUINTON WALL on 7/31/16.
//  Copyright © 2016 Quinton Wall. All rights reserved.
//

import Foundation

public extension URL {
    
    public typealias Params = [String: AnyObject]
    
    public func paramsDictonary() -> Params {
        var params = Params()
        if let urlParams = query {
            let splitParams = urlParams.characters.split { $0 == "&" }.map { String($0) }
            for param in splitParams {
                let paramKVP = param.characters.split { $0 == "=" }.map { String($0) }
                if paramKVP.count > 1 {
                    params[paramKVP[0]] = paramKVP[1] as AnyObject?
                }
            }
        }
        
        return params
    }
    
    /**
     * Returns an NSURL instance that can used to fetch protected salesforce content like photoURLs
     * parameter: a valid salesforce sessionid or authtoken
     */
    public func protectedSalesforceURL(_ authtoken: String) -> URL {
        
        
        assert(self.isHTTPS(), "URL must be HTTPS for protected Salesforce Endpoints.")
        
        return URL(string: self.absoluteString+"?oauth_token=\(authtoken)")!
    }
    
    public func isHTTPS()->Bool{
        
        if(self.absoluteString.hasPrefix("https")){
            return true
        }
        return false
    }
    
    
}
