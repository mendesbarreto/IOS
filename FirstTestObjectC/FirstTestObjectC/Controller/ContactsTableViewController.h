//
//  ContactsTableViewController.h
//  FirstTestObjectC
//
//  Created by Douglas Barreto on 12/21/15.
//  Copyright © 2015 Douglas Barreto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewContactViewController.h"

@interface ContactsTableViewController : UITableViewController <NewContactViewControllerDelegate>
@property (nonatomic, strong) NSMutableArray *contacts;
@end
