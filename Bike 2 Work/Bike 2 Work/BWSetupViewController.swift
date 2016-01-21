//
//  BWSetupViewController.swift
//  Bike 2 Work
//
//  Created by Douglas Barreto on 1/19/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

import UIKit

public class BWSetupViewController: UIViewController {
    @IBOutlet weak var textView:UITextView?
    
    
    override public func viewDidLoad()
    {
        let data = NSData(contentsOfFile: "");
        
        let parsedString = parseStringToView(" Eu sou o produto Eu sou o #link para o produto# ");
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: Selector("tappedTextView:"));
        textView?.addGestureRecognizer(tapRecognizer);
        textView?.selectable = true;
        
        let stringBuffer = NSMutableAttributedString();
        
        //Creating my attributes
        let foregroundAttr = [ NSForegroundColorAttributeName: UIColor.greenColor() ];
        let backgroundAttr = [ NSBackgroundColorAttributeName: UIColor.yellowColor() ]
        let underLineAttr = [ NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleDouble.rawValue ]
        let linkAttr = [ NSLinkAttributeName: NSURL(string: "settings:option")!];
        
        //Mutable Atribute string
        let strAttr = NSMutableAttributedString(string: "Hello",attributes: foregroundAttr);
        let strAttr2 = NSMutableAttributedString(string: " Hello2",attributes: backgroundAttr);
        let strAttr3 = NSMutableAttributedString(string: " Hello3", attributes:linkAttr);
        
        stringBuffer.appendAttributedString(strAttr);
        stringBuffer.appendAttributedString(strAttr2);
        stringBuffer.appendAttributedString(strAttr3);
        
        textView?.attributedText = stringBuffer;
    }
    
    
    public func parseStringToView( str:NSString )
    {
        
    }
    
    public func tappedTextView(tapGesture: UIGestureRecognizer) {
        
        let textView = tapGesture.view as! UITextView;
        let tapLocation = tapGesture.locationInView(textView);
        let textPosition = textView.closestPositionToPoint(tapLocation);
        let attr: NSDictionary = textView.textStylingAtPosition(textPosition!, inDirection: UITextStorageDirection.Forward)!;
        
        if let url: NSURL = attr[NSLinkAttributeName] as? NSURL {
            UIApplication.sharedApplication().openURL(url)
            print("Clicou \(url)");
        }
    }
    
    //let color:UIColor = UIColor(red: 0.07, green: 0.19, blue: 0.27, alpha: 1.00)
}
