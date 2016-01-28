//
//  BWDisplayText.swift
//  Bike 2 Work
//
//  Created by Douglas Barreto on 1/27/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

import Foundation
import UIKit

public class BWDisplayText: BWDisplayTextProtocol{
    
    public var titleAttInfo:BWAttributedStringInfo;
    public var textAttInfo:BWAttributedStringInfo;
    
    public var displayText:NSMutableAttributedString;
    public var attributedText:NSMutableAttributedString { return displayText; }
    public var stringText:String{
        return textAttInfo.text;
    }
    
    public init(title:String = "" , rawText:String = "")
    {
        self.textAttInfo = BWAttributedStringInfo(str: rawText);
        self.titleAttInfo = BWAttributedStringInfo(str: title);
        self.displayText = NSMutableAttributedString();
        
        setDefaultValueTextInfo();
        setDefaultValueTitleTextInfo();
    }
    
    public func setDefaultValueTextInfo(){
        textAttInfo.fontSize = 18;
    }
    
    public func setDefaultValueTitleTextInfo(){
        titleAttInfo.fontSize = 25;
    }
    
    public func updateText() ->NSMutableAttributedString{
        preconditionFailure("This method must be overridden");
    }
}