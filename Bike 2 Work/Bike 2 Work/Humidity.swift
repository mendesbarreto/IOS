//
//  Humidity.swift
//  Bike 2 Work
//
//  Created by Douglas Barreto on 1/27/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

import Foundation

public class Humidity : ConstraintNumbers
{
    public init(){
        super.init(start: 10, end: 30);
    }
    
    public func getStartHumidityFormated() ->String{
        return Humidity.getHumidityFormated(start);
    }
    
    public func getEndtHumidityFormated() ->String{
        return Humidity.getHumidityFormated(end);
    }
    
    public class func getHumidityFormated( humidity: Int) ->String{
        return "\(humidity)%";
    }
}