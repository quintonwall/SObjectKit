//
//  String.swift
//  
//
//  Created by QUINTON WALL on 7/31/16.
//  Copyright © 2016 Quinton Wall. All rights reserved.
//

import Foundation

public extension String {
    public func contains(_ string: String) -> Bool {
        return range(of: string) != nil
    }
    
    subscript(i: Int) -> Character {
        return self[self.characters.index(self.startIndex, offsetBy: i)]
    }
    
    subscript(i: Int) -> String {
        return String(self[i] as Character)
    }
    
    /*
    subscript(r: Range<Int>) -> String {
        let start = startIndex.advancedBy(r.lowerBound)
        let end = start.advancedBy(r.upperBound - r.lowerBound)
        return self[start..<end]
    }
*/
    func trunc(_ length: Int, trailing: String? = "...") -> String {
        if self.characters.count > length {
            return self.substring(to: self.characters.index(self.startIndex, offsetBy: length)) + (trailing ?? "")
        } else {
            return self
        }
    }
    
    func insert(_ string:String,ind:Int) -> String {
        return  String(self.characters.prefix(ind)) + string + String(self.characters.suffix(self.characters.count-ind))
    }
    
    func indexOf(_ string: String) -> Int {
        return characters.distance(from: startIndex, to: (range(of: string, options: .literal, range: nil, locale: nil)?.lowerBound)!)
    }
    
    
}

public extension Optional {
    public func contains(_ string: String) -> Bool {
        switch self {
        case .none:
            return false
        case let .some(value):
            if value is Int {
                return "\((value as! Int))".range(of: string) != nil
            } else if value is String {
                return (value as! String).range(of: string) != nil
            }
        }
        
        return false
    }
    
    public func contains(_ int: Int) -> Bool {
        return contains("\(int)")
    }
    
}
