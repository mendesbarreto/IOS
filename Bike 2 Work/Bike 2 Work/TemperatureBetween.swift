//
//  TemperatureBetween.swift
//  Bike 2 Work
//
//  Created by Douglas Barreto on 1/27/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

import Foundation

public class BWTemperatureBetween
{
    public var start: Temperature;
    public var end: Temperature;
    
    public init(start:Int, end:Int)
    {
        self.start = Temperature(graus: start);
        self.end = Temperature(graus: end);
    }
    
    public func isTemperaturesValid()->Bool {
        return start.graus < end.graus;
    }
}