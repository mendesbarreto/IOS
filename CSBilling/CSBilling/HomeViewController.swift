//
//  ViewController.swift
//  CSBilling
//
//  Created by Douglas Barreto on 2/2/16.
//  Copyright © 2016 Concrete Solutions. All rights reserved.
//

import UIKit

@objc(ViewController)
class ViewController: UIViewController , GIDSignInUIDelegate {
    
    // [START viewcontroller_vars]
    @IBOutlet weak var signInBt : GIDSignInButton!;
    @IBOutlet weak var signOutBt: UIButton!;
    @IBOutlet weak var disconnectBt: UIButton!;
    @IBOutlet weak var statusTxt: UILabel!;
    
    // [START viewdidload]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        // Uncomment to automatically sign in the user.
        //GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        // [START_EXCLUDE]
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "receiveToggleAuthUINotification:",
            name: "ToggleAuthUINotification",
            object: nil)
        
        statusTxt.text = "Initialized Swift app..."
        toggleAuthUI()
        // [END_EXCLUDE]
    }
    // [END viewdidload]
    
    // [START signout_tapped]
    @IBAction func onClickSignOut(sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
        // [START_EXCLUDE silent]
        statusTxt.text = "Signed out."
        toggleAuthUI()
        // [END_EXCLUDE]
    }
    // [END signout_tapped]
    
    // [START disconnect_tapped]
    @IBAction func onClickDisconnect(sender: AnyObject) {
        GIDSignIn.sharedInstance().disconnect()
        // [START_EXCLUDE silent]
        statusTxt.text = "Disconnecting."
        // [END_EXCLUDE]
    }
    // [END disconnect_tapped]
    
    // [START toggle_auth]
    func toggleAuthUI() {
        if (GIDSignIn.sharedInstance().hasAuthInKeychain()){
            // Signed in
            signInBt.hidden = true
            signOutBt.hidden = false
            disconnectBt.hidden = false
        } else {
            signInBt.hidden = false
            signOutBt.hidden = true
            disconnectBt.hidden = true
            statusTxt.text = "Google Sign in\niOS Demo"
        }
    }
    // [END toggle_auth]
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self,
            name: "ToggleAuthUINotification",
            object: nil)
    }
    
    @objc func receiveToggleAuthUINotification(notification: NSNotification) {
        if (notification.name == "ToggleAuthUINotification") {
            self.toggleAuthUI()
            if notification.userInfo != nil {
                let userInfo:Dictionary<String,String!> =
                notification.userInfo as! Dictionary<String,String!>
                self.statusTxt.text = userInfo["statusText"]
            }
        }
    }
}

