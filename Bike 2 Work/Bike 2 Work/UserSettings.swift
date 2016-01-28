//
//  UserSettings.swift
//  Bike 2 Work
//
//  Created by Douglas Barreto on 1/22/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

import Foundation

public class UserSettings
{
    public static let sharedInstance = UserSettings();
    public var hourToBike: HourToBike;
    public var humidity: Humidity;
    public var temperature: BWTemperatureBetween;
    public var city:String;
    
    
    private init(){
        hourToBike = HourToBike();
        humidity = Humidity();
        temperature = BWTemperatureBetween(start: 20, end: 30);
        city = "Choose a City"
    }
    
    public func beginBikeAt( hours:Int , minutes: Int){
        hourToBike.start = Hour(hour: hours, minutes: minutes);
    }
    public func endBikeAt( hours:Int , minutes:Int){
        hourToBike.end = Hour(hour: hours, minutes: minutes);
    }
    
    public func beginHumidity( start: Int){
        humidity.start = start;
    }
    
    public func endHumidity( end: Int){
        humidity.end = end;
    }
}