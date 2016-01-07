//
//  DMBReminderViewController.m
//  HypnoDouglas
//
//  Created by Douglas Barreto on 1/6/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "DMBReminderViewController.h"

@implementation DMBReminderViewController

-(IBAction)selector:(id)sender
{
    NSDate *date = self.datePicker.date;
    
    NSLog(@"Setting a reminder for %@ \n", date);
    
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Let's get some crazy Hipnosys";
    note.fireDate = date;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
    
}


-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self)
    {
        self.tabBarItem.title = @"Reminder!";
        UIImage *img = [UIImage imageNamed:@"Time.png"];
        self.tabBarItem.image = img;
    }
    
    
    return self;
}


@end
