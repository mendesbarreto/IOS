//
//  NewContactViewController.m
//  FirstTestObjectC
//
//  Created by Douglas Barreto on 12/21/15.
//  Copyright © 2015 Douglas Barreto. All rights reserved.
//

#import "NewContactViewController.h"

@interface NewContactViewController ()

@end

@implementation NewContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveButtonClickHandler:(UIButton *)sender {
    User *user = [[User alloc] init];
    [user setName: self.inputName.text];
    [user setPhoneNumber: self.inputPhoneNumber.text];
    [user setEmail:self.inputEmail.text];
    
    if( self.delegate )
    {
        [self.delegate newContactViewController:self  clickbuttonDone:user];
    }
    // Essa funcao retorna para pagina anterior
    [[self navigationController] popViewControllerAnimated:YES];
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
