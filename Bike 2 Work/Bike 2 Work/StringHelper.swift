//
//  File.swift
//  Bike 2 Work
//
//  Created by Douglas Barreto on 1/27/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

import Foundation
import UIKit

public class StringHelper
{
    public class func insertOptionsLinkAtrributesToRange( inout attriutedString attStr:NSMutableAttributedString, range:NSRange, option:String ){
        let urlString = "\(option)";
        let nsUrl = NSURL(string: urlString)!;
        let linkAttr = [ NSLinkAttributeName: nsUrl];
        attStr.addAttributes(linkAttr, range: range);
    }
    
    public class func replaceVariableNameToLinkString( name:String , valueToAdd:String, inout attString:NSMutableAttributedString){
        
        let tempStr = attString.string as NSString;
        var rangeStr = tempStr.rangeOfString(name);
        
        attString.replaceCharactersInRange(rangeStr, withString: valueToAdd);
        rangeStr = NSMakeRange(rangeStr.location, valueToAdd.characters.count);
        insertOptionsLinkAtrributesToRange(attriutedString: &attString, range: rangeStr, option: name);
    }
    
    public class func updateTextWithVariableName( variableName:String, value:String, inout text:String )
    {
        text = text.stringByReplacingOccurrencesOfString(variableName, withString:value);
    }
    
    public class func addAtributeTo(inout string attStr:NSMutableAttributedString, attributes:[String:AnyObject])
    {
        let range = NSMakeRange(0, attStr.length);
        attStr.addAttributes(attributes, range: range);
    }
    
}