//
//  HomePageViewController.m
//  InstagramViewer
//
//  Created by Douglas Barreto on 12/22/15.
//  Copyright © 2015 Douglas Mendes. All rights reserved.
//

#import "HomePageViewController.h"
#import "CatsTableViewController.h"


@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.loginView.signInButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) buttonClicked:(UIButton *) sender
{
    NSLog(@"Hello I am herer");
    CatsTableViewController *tb = [self.storyboard instantiateViewControllerWithIdentifier:@"CatsTableViewController"];
    
    [self.navigationController pushViewController:tb animated:YES];
    
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
