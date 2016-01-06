//
//  DMBHypnosisViewController.m
//  HypnoDouglas
//
//  Created by Douglas Barreto on 1/6/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

#import "DMBHypnosisViewController.h"
#import "DMBHypnosisView.h"

@implementation DMBHypnosisViewController

-(void)loadView
{
    DMBHypnosisView* background = [[DMBHypnosisView alloc] init];
    self.view = background;
}

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    
    if(self)
    {
        self.tabBarItem.title = @"Hypnotize";
        UIImage *img = [UIImage imageNamed:@"Hypno.png"];
        self.tabBarItem.image = img;
    }
    
    return self;
}


@end
