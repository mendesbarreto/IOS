//
//  NewContactViewController.h
//  FirstTestObjectC
//
//  Created by Douglas Barreto on 12/21/15.
//  Copyright © 2015 Douglas Barreto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@class NewContactViewController;

@protocol NewContactViewControllerDelegate <NSObject>

-(void)newContactViewController: (NewContactViewController *)controller clickbuttonDone: (User *)user;


@end


@interface NewContactViewController : UIViewController

@property (nonatomic, strong) id<NewContactViewControllerDelegate> delegate;
@property (nonatomic, strong) IBOutlet UITextField *inputName;
@property (nonatomic, strong) IBOutlet UITextField *inputPhoneNumber;
@property (nonatomic, strong) IBOutlet UITextField *inputEmail;
@end
