//
//  HSCardBoardViewController.m
//  HearthstoneCards
//
//  Created by Douglas Barreto on 1/12/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

#import "HSCardBoardViewController.h"

@interface HSCardBoardViewController ()

@end

@implementation HSCardBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    __block CGRect rect = CGRectMake(0, 0, 200, 200);
    
    self.card = [[UIView alloc] initWithFrame:rect];
    self.card.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.card];
    
    rect.origin.x = 100;
    
    [UIView animateWithDuration:2.0 animations:^{
        
        self.card.frame = rect;
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
