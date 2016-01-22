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
    
    public static let hourStartName = "$hourStart";
    public static let hourEndName = "$hourEnd";
    public static let temperatureStartName = "$temperatureStart";
    public static let temperatureEndName = "$temperatureEnd";
    public static let humidityStartName = "$humidityStart";
    public static let humidityEndName = "$humidityEnd";
    
    public private(set) var displayText:NSMutableAttributedString;
    
    public init()
    {
        displayText = NSMutableAttributedString(string: originalText);
    }
    
    public var originalText:String = "between $hourStart and $hourEnd, there's less than 10% chance of raining, the temperature is higher than $temperatureStart and lower than $temperatureEnd, and humidity varies between $humidityStart and $humidityEnd"
        {
        willSet(newOriginalText) {
            print("About to set totalSteps to \(newOriginalText)");
            updateText();
        }
    }
    
    public func updateText() ->NSMutableAttributedString
    {
        displayText = NSMutableAttributedString(string: originalText, attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()]);
        
        replaceVariableName(Setup.hourStartName,valueToAdd: "10:00", attString: &displayText);
        replaceVariableName(Setup.hourEndName,valueToAdd: "11:00", attString: &displayText);
        replaceVariableName(Setup.temperatureStartName,valueToAdd: "30ºF", attString: &displayText);
        replaceVariableName(Setup.temperatureEndName,valueToAdd: "40ºF", attString: &displayText);
        replaceVariableName(Setup.humidityStartName,valueToAdd: "10%", attString: &displayText);
        replaceVariableName(Setup.humidityEndName,valueToAdd: "60%", attString: &displayText);
        
        return displayText;
    }
    
    public func updateBikeToWorkDiplayText( textView:UITextView ){
        textView.attributedText = updateText();
        textView.linkTextAttributes = [NSForegroundColorAttributeName: Setup.greenColorAttr,
            NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue];
    }
    
    private func insertOptionsLinkAtrributesToRange( inout attriutedString attStr:NSMutableAttributedString, range:NSRange, option:String ){
        
        let urlString = "\(option)";
        let nsUrl = NSURL(string: urlString)!;
        let linkAttr = [ NSLinkAttributeName: nsUrl];
        
        attStr.addAttributes(linkAttr, range: range);
        //        attStr.addAttributes(Setup.foregroundGreenColorAttr, range: range);
        //        attStr.addAttributes(Setup.underLineAttr, range: range);
        //        //print(attStr);
    }
    
    private func replaceVariableName( name:String , valueToAdd:String, inout attString:NSMutableAttributedString){
        
        let tempStr = attString.string as NSString;
        var rangeStr = tempStr.rangeOfString(name);
        
        attString.replaceCharactersInRange(rangeStr, withString: valueToAdd);
        rangeStr = NSMakeRange(rangeStr.location, valueToAdd.characters.count);
        insertOptionsLinkAtrributesToRange(attriutedString: &attString, range: rangeStr, option: name);
        //print(attString);
    }
    
    private func updateTextWithVariableName( variableName:String, value:String, inout text:String )
    {
        text = text.stringByReplacingOccurrencesOfString(variableName, withString:value);
    }
    
}