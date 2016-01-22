//
//  File.swift
//  Bike 2 Work
//
//  Created by Douglas Barreto on 1/22/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

import Foundation

public class Temperature
{
    private let metricType:Metrics;
    public var graus:Int;
    
    public enum Metrics:String
    {
        case Celsius = "ºC";
        case Fahrenheit = "ºF";
    }
    
    public init( graus:Int, metricType metric:Metrics = .Celsius)
    {
        self.graus = graus;
        self.metricType = metric
    }
    
    public func getGraus(metric:Metrics = .Celsius) -> String
    {
        var g:Int = self.graus;
        if metric == .Celsius && metricType == .Fahrenheit{
            g = Temperature.getCelsiusFromFahrenheit(graus);
        }
        else if metric == .Fahrenheit && metricType == .Celsius{
            g = Temperature.getFahrenheitFromCelsius(graus);
        }
        
        return "\(g)\(metric.rawValue)";
    }
    
    class func getFahrenheitFromCelsius( celsius: Int ) ->Int{
        return Int(Double(32.0+(Double(celsius)*9.0 / 5.0)));
    }
    
    class func getCelsiusFromFahrenheit( fahrenheit:Int) ->Int{
        return Int(Double(Float( 5.0 / 9.0 ) * Float( (fahrenheit-32))));
    }
}