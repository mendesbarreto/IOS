//
//  BWSetupViewController.swift
//  Bike 2 Work
//
//  Created by Douglas Barreto on 1/19/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

import UIKit

public class BWSetupViewController: UIViewController {
    @IBOutlet weak var cityTextView:UITextView?;
    @IBOutlet weak var bikeToWorkTextView:UITextView?;
    @IBOutlet weak var dayToBikeTextView:UITextView?;
    
    override public func viewDidLoad()
    {
        let tapRecognizerC = UITapGestureRecognizer(target: self, action: Selector("tappedTextView:"));
        cityTextView?.userInteractionEnabled = true;
        cityTextView?.selectable = false;
        cityTextView?.addGestureRecognizer(tapRecognizerC);
        
        let tapRecognizerB = UITapGestureRecognizer(target: self, action: Selector("tappedTextView:"));
        bikeToWorkTextView?.userInteractionEnabled = true;
        bikeToWorkTextView?.selectable = false;
        bikeToWorkTextView?.addGestureRecognizer(tapRecognizerB);
        
        let tapRecognizerD = UITapGestureRecognizer(target: self, action: Selector("tappedTextView:"));
        dayToBikeTextView?.userInteractionEnabled = true;
        dayToBikeTextView?.selectable = false;
        dayToBikeTextView?.addGestureRecognizer(tapRecognizerD);
        
        Setup.sharedInstance.updateCitykDiplayText(cityTextView!);
        Setup.sharedInstance.updateBikeToWorkDiplayText(bikeToWorkTextView!);
        Setup.sharedInstance.updateDaysToBikeDiplayText(dayToBikeTextView!);
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
