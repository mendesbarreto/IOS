//
//  DMBHomePageViewController.h
//  HearthstoneCards
//
//  Created by Douglas Barreto on 1/7/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface DMBHomePageViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel * userName;

-(IBAction)getCardsFromServer:(id)sender;

@end
