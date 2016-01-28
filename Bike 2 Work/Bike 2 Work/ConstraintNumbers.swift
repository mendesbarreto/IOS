//
//  ConstraintNumbers.swift
//  Bike 2 Work
//
//  Created by Douglas Barreto on 1/27/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

import Foundation

public class ConstraintNumbers
{
    public var start: Int;
    public var end : Int;
    
    public init( start: Int , end: Int){
        self.start = start;
        self.end = end;
    }
    
    public func isValid() -> Bool{
        return start <= end;
    }
}