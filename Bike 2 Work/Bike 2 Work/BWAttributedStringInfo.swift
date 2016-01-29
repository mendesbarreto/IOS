//
//  SetupString.swift
//  Bike 2 Work
//
//  Created by Douglas Barreto on 1/27/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

import Foundation
import UIKit

public class BWAttributedStringInfo
{
    public var fontSize:Float = 20.0;
    public var fontColor = 0xFFFFFF;
    public var fontName = "Arial"
    public let paragraphSpacingBefore:Float = 10.0;
    public var text:String;
    
    public init( str:String = "")
    {
        self.text = str + "\n";
    }
    
    public func getAttributes() -> [String:AnyObject]
    {
        let p = NSMutableParagraphStyle();
        p.paragraphSpacingBefore = CGFloat(paragraphSpacingBefore);
        
        return [
            NSForegroundColorAttributeName: UIColor(netHex: fontColor),
            NSParagraphStyleAttributeName : p,
            NSFontAttributeName:UIFont(name: fontName, size: CGFloat(fontSize))!];
    }
}