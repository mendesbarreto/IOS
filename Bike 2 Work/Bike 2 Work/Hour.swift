//
//  Hour.swift
//  Bike 2 Work
//
//  Created by Douglas Barreto on 1/22/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

import Foundation

public class Hour
{
    public let hour:Int;
    public let minutes:Int;
    
    public init( hour:Int, minutes:Int )
    {
        self.hour = hour;
        self.minutes = minutes;
    }
    
    var description:String { return "\(hour):\(minutes)";}
}