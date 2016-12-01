//
//  NSURL.swift
//  DHNative
//
//  Created by QUINTON WALL on 7/31/16.
//  Copyright © 2016 Quinton Wall. All rights reserved.
//

import Foundation

public extension NSURL {
    
    public typealias Params = [String: AnyObject]
    
    public func paramsDictonary() -> Params {
        var params = Params()
        if let urlParams = query {
            let splitParams = urlParams.characters.split { $0 == "&" }.map { String($0) }
            for param in splitParams {
                let paramKVP = param.characters.split { $0 == "=" }.map { String($0) }
                if paramKVP.count > 1 {
                    params[paramKVP[0]] = paramKVP[1]
                }
            }
        }
        
        return params
    }
    
}