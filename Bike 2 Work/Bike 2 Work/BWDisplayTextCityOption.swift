//
//  BWDisplayTextCityOption.swift
//  Bike 2 Work
//
//  Created by Douglas Barreto on 1/27/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

import Foundation
import UIKit


public class BWDisplayTextCityOption: BWDisplayText
{
    private let userSettings:UserSettings;
    
    override init(title: String, rawText: String) {
        userSettings = UserSettings.sharedInstance;
        super.init(title: title, rawText:rawText);
    }
    
    
    public override func updateText() -> NSMutableAttributedString {
        var tempTitle = NSMutableAttributedString();
        var tempPlainText = NSMutableAttributedString();
        displayText = NSMutableAttributedString();
        
        StringHelper.replaceVariableNameToLinkString(
            kCityVariableName,
            valueToAdd: userSettings.city,
            attString: &tempPlainText);
        
        StringHelper.addAtributeTo(string: &tempTitle, attributes: titleAttInfo.getAttributes());
        
        displayText.appendAttributedString(tempTitle);
        displayText.appendAttributedString(tempPlainText);
        
        return displayText;
    }
}
