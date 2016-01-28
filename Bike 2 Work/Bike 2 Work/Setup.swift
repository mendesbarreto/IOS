//
//  Setup.swift
//  Bike 2 Work
//
//  Created by Douglas Barreto on 1/22/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

import Foundation
import UIKit

public class Setup
{
    public static let sharedInstance = Setup();
    public static let greenColorAttr = UIColor(colorLiteralRed: (144.0 / 255.0), green: (219.0 / 255.0), blue: (135.0 / 255.0), alpha: 1.0);
    public static let whiteColorAttr = UIColor.whiteColor();
    
    public private(set) var displayText:NSMutableAttributedString;
    
    public var citySetupTextSetup:BWDisplayTextCityOption;
    public var notifySetpuTextSetup = BWAttributedStringInfo();
    public var bikeToWorkDisplayText:BWDiplayTextBikeToWorkOption;
    
    public init()
    {
        
        citySetupTextSetup = BWDisplayTextCityOption(title: "I live in... \n \n", rawText: "$city \n \n");
        
        bikeToWorkDisplayText = BWDiplayTextBikeToWorkOption(
            title:"Hello Man \n" ,
            rawText:"between $hourStart and $hourEnd, there's less than 10% chance of raining, the temperature is higher than $temperatureStart and lower than $temperatureEnd, and humidity varies between $humidityStart and $humidityEnd");
        
        displayText = citySetupTextSetup.updateText();
        displayText.appendAttributedString(bikeToWorkDisplayText.updateText());
    }
    
    public func updateBikeToWorkDiplayText( textView:UITextView ){
        
        textView.attributedText = displayText;
        textView.linkTextAttributes = [NSForegroundColorAttributeName: Setup.greenColorAttr,
            NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue];
    }
    
    
}