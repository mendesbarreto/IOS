//: Playground - noun: a place where people can play

import Cocoa

public class Temperature
{
    private let metricType:Metrics;
    public var graus:Int;
    
    public enum Metrics:String
    {
        case Celsius = "ºC";
        case Fahrenheit = "ºF";
    }
    
    public init( graus:Int, MetricType metric:Metrics = .Celsius)
    {
        self.graus = graus;
        self.metricType = metric
    }
    
    public func getGrausBy(MetricsType metric:Metrics = .Celsius) -> String
    {
        var g:Int = self.graus;
        
        if metric == .Celsius && metricType == .Fahrenheit
        {
            let result:Double = Double(Float( 5.0 / 9.0 ) * Float( (graus-32)));
            g = Int(result);
        }
        else if metric == .Fahrenheit && metricType == .Celsius
        {
            let result:Double = Double(32.0 + (graus * 9.0 / 5.0));
            g = Int(result);
        }
        
        return "\(g)\(metricType)";
    }
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
    
    var description:String { return "\(hour):\(minutes)";}
}


public class Setup
{
    public static let sharedInstance = Setup();
    
    public static let hourStartName = "$hourStart";
    public static let hourEndName = "$hourEnd";
    public static let temperatureStartName = "$temperatureStart";
    public static let temperatureEndName = "$temperatureEnd";
    public static let humidityStartName = "$humidityStart";
    public static let humidityEndName = "$humidityEnd";
    
    public private(set) var diplayText:String = "";
    
    public var originalText:String = "between $hourStart and $hourEnd, there's less than 10% chance of raining, the temperature is higher than $temperatureStart and lower than $temperatureEnd, and humidity varies between $humidityStart and $humidityEnd"
        {
        willSet(newOriginalText) {
            print("About to set totalSteps to \(newOriginalText)");
            updateText();
        }
    }
    
    public func updateText()
    {
        
    }
}




