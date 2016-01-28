//
//  HourToBike.swift
//  Bike 2 Work
//
//  Created by Douglas Barreto on 1/22/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

import Foundation

public class HourToBike {
    
    public var start:Hour = Hour(hour: 10,minutes: 0);
    public var end:Hour = Hour(hour: 8, minutes: 0);
    
    public func isHoursValid() -> Bool{
        return start < end;
    }
    
    public func getStartHoursFormated() ->String{
        return HourToBike.getHoursFormated(start);
    }
    
    public func getEndHoursFormated() ->String{
        return HourToBike.getHoursFormated(end);
    }
    
    public class func getHoursFormated( h:Hour ) ->String
    {
        var symbol = "PM";
        var hoursAndMinutes = "";
        
        let hours = h.hour;
        let minutes = h.minutes;
        
        if hours < 12 {
            symbol = "AM";
        }
        
        if minutes == 0{
            hoursAndMinutes = "\(hours)\(symbol)";
        }
        else{
            hoursAndMinutes = "\(hours):\(minutes)\(symbol)";
        }
        
        return hoursAndMinutes;
    }
    
}