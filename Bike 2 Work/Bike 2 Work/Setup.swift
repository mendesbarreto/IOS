//
//  Setup.swift
//  Bike 2 Work
//
//  Created by Douglas Barreto on 1/22/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

public class Setup
{
    public static let sharedInstance = Setup();
    public static let greenColorAttr = UIColor(colorLiteralRed: (144.0 / 255.0), green: (219.0 / 255.0), blue: (135.0 / 255.0), alpha: 1.0);
    public static let whiteColorAttr = UIColor.whiteColor();
    
    //public private(set) var displayText:NSMutableAttributedString;
    
    public var citySetupTextSetup:BWDisplayTextCityOption;
    public var daySetpuTextSetup:BWDisplayTextDayToBikeOption;
    public var bikeToWorkDisplayText:BWDiplayTextBikeToWorkOption;
    
    public init()
    {
        Alamofire.request(.GET, "https://api.dribbble.com/v1/shots?access_token=22e5b3c100a0e1b4aa3f66d4f95f9101895b3829dea28fd651e4b824817bb295")
            .responseJSON{ response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
        
        citySetupTextSetup = BWDisplayTextCityOption(title: "I live in...", rawText: "$city");
        
        bikeToWorkDisplayText = BWDiplayTextBikeToWorkOption(
            title:"I'll bike to work if" ,
            rawText:"between $hourStart and $hourEnd, there's less than 10% chance of raining, the temperature is higher than $temperatureStart and lower than $temperatureEnd, and humidity varies between $humidityStart and $humidityEnd");
        
        daySetpuTextSetup = BWDisplayTextDayToBikeOption(title: "Notify me...", rawText: "$day at $hour");
        
        
        //displayText = citySetupTextSetup.updateText();
        //displayText.appendAttributedString(bikeToWorkDisplayText.updateText());
    }
    
    public func updateCitykDiplayText( textView:UITextView ){
        
        textView.attributedText = citySetupTextSetup.updateText();
        textView.linkTextAttributes = [NSForegroundColorAttributeName: Setup.greenColorAttr,
            NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue];
    }
    
    public func updateBikeToWorkDiplayText( textView:UITextView ){
        
        textView.attributedText = bikeToWorkDisplayText.updateText();
        textView.linkTextAttributes = [NSForegroundColorAttributeName: Setup.greenColorAttr,
            NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue];
    }
    
    public func updateDaysToBikeDiplayText( textView:UITextView ){
        textView.attributedText = daySetpuTextSetup.updateText();
        textView.linkTextAttributes = [NSForegroundColorAttributeName: Setup.greenColorAttr,
            NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue];
    }
    
    
    
    
}