//
//  Hour.swift
//  Bike 2 Work
//
//  Created by Douglas Barreto on 1/22/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

import Foundation

func == (left: Hour , right:Hour) -> Bool{
    return left.getInMinutes() == right.getInMinutes();
}

func <(left: Hour , right:Hour) -> Bool{
    return left.getInMinutes() < right.getInMinutes();
}

func >(left: Hour , right:Hour) -> Bool{
    return left.getInMinutes() > right.getInMinutes();
}

func +=(inout left: Hour, right: Hour)->Hour{
    left = left + right;
    return left;
}

func +(left: Hour, right: Hour) -> Hour{
    let mResult = left.getInMinutes() + right.getInMinutes();
    return Hour(hour: mResult / 60, minutes: mResult % 60);
}

public class Hour
{
    public let hour:Int;
    public let minutes:Int;
    
    public init( hour:Int, minutes:Int )
    {
        self.hour = hour;
        self.minutes = minutes;
    }
    
    public func getInMinutes() ->Int{
        //Scaleing and sum everything to minuts
        return (hour * 60) + (minutes);
    }
    
    var description:String { return "\(hour):\(minutes)";}
}