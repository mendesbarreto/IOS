//
//  ContactsTableViewController.m
//  FirstTestObjectC
//
//  Created by Douglas Barreto on 12/21/15.
//  Copyright © 2015 Douglas Barreto. All rights reserved.
//

#import "NewContactViewController.h"
#import "ContactsTableViewController.h"
#import "User.h"
#import "TableViewCellItem.h"

@interface ContactsTableViewController ()

@end

@implementation ContactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onAddButtonClickHandler:)];
    
    [self.navigationItem setLeftBarButtonItem:add];
    
    User *user = [[User alloc] init];
    
    [user setName:@"Luam"];
    [user setPhoneNumber:@"119876578"];
    [user setEmail:@"mendes-barreto@live.com"];
    
    self.contacts = [@[user,user,user] mutableCopy];
}

- (void)newContactViewController:(NewContactViewController *)controller clickbuttonDone:(User *)user
{
    [[self contacts] addObject:user];
    [[self tableView] reloadData];
}

-(void)onAddButtonClickHandler:(UIBarButtonItem *)b
{
    NewContactViewController *vcNewContact = [[self storyboard]instantiateViewControllerWithIdentifier:@"NewContact"];
    [vcNewContact setDelegate:self];
    [[self navigationController] pushViewController:vcNewContact animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self contacts].count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TableViewCellItem *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell)
    {
        cell = (TableViewCellItem *)[[NSBundle mainBundle] loadNibNamed:@"TableViewCellItem" owner:self options:nil][0];
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"]
        User *user = [self contacts][indexPath.row];
        
        [[cell name] setText:user.name];
        [[cell phoneNumber] setText:user.phoneNumber];
        [[cell email] setText:user.email];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[self contacts] removeObjectAtIndex:indexPath.row];
        
        //Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
         //Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
