//
//  BWDiplayText.swift
//  Bike 2 Work
//
//  Created by Douglas Barreto on 1/27/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

import Foundation
import UIKit


public class BWDiplayTextBikeToWorkOption : BWDisplayText
{
    //    public static let hourStartName = "$hourStart";
    //    public static let hourEndName = "$hourEnd";
    //    public static let temperatureStartName = "$temperatureStart";
    //    public static let temperatureEndName = "$temperatureEnd";
    //    public static let humidityStartName = "$humidityStart";
    //    public static let humidityEndName = "$humidityEnd";
    
    private let userSettings:UserSettings;
    
    override init(title: String, rawText: String) {
        
        userSettings = UserSettings.sharedInstance;
        super.init(title: title, rawText:rawText);
    }
    
    override public func updateText() ->NSMutableAttributedString
    {
        let hToBike = userSettings.hourToBike;
        let humidity = userSettings.humidity;
        let temperature = userSettings.temperature;
        var tempPlainText = NSMutableAttributedString(string: stringText);
        var tempTitle = NSMutableAttributedString(string: titleAttInfo.text);
        
        displayText = NSMutableAttributedString();
        
        StringHelper.replaceVariableNameToLinkString(
            kHourStartName,
            valueToAdd: hToBike.getStartHoursFormated(),
            attString: &tempPlainText);
        
        StringHelper.replaceVariableNameToLinkString(
            kHourEndName,
            valueToAdd:hToBike.getEndHoursFormated(),
            attString: &tempPlainText);
        
        StringHelper.replaceVariableNameToLinkString(
            kTemperatureStartName,
            valueToAdd: temperature.start.getGraus(),
            attString: &tempPlainText);
        
        StringHelper.replaceVariableNameToLinkString(
            kTemperatureEndName,
            valueToAdd: temperature.end.getGraus(),
            attString: &tempPlainText);
        
        StringHelper.replaceVariableNameToLinkString(
            kHumidityStartName,
            valueToAdd: humidity.getStartHumidityFormated(),
            attString: &tempPlainText);
        
        StringHelper.replaceVariableNameToLinkString(
            kHumidityEndName,
            valueToAdd: humidity.getEndtHumidityFormated(),
            attString: &tempPlainText);
        
        StringHelper.addAtributeTo(
            string: &tempPlainText,
            attributes: textAttInfo.getAttributes());
        
        StringHelper.addAtributeTo(
            string: &tempTitle,
            attributes: titleAttInfo.getAttributes());
        
        displayText.appendAttributedString(tempTitle);
        displayText.appendAttributedString(tempPlainText);
        
        return displayText;
    }
}