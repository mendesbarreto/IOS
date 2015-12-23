//
//  LoginUIView.h
//  InstagramViewer
//
//  Created by Douglas Barreto on 12/22/15.
//  Copyright © 2015 Douglas Mendes. All rights reserved.
//

#import <UIKit/UIKit.h>
#

@interface LoginUIView : UIView
@property (weak, nonatomic)IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *signInButton;

@end
