//
//  CatsTableViewController.m
//  InstagramViewer
//
//  Created by Douglas Barreto on 12/29/15.
//  Copyright © 2015 Douglas Mendes. All rights reserved.
//

#import "CatsTableViewController.h"
#import <Parse/Parse.h>
#import <ParseCrashReporting.h>
#import <ParseUI/ParseUI.h>
#import <Bolts/Bolts.h>
#import "CatsTableViewCell.h"

@interface CatsTableViewController ()

@end

@implementation CatsTableViewController
static NSString *cellIdentifier = @"CatCell";

- (void)customInit {
    self.parseClassName = @"Cat";
    self.pullToRefreshEnabled = YES;
    self.paginationEnabled = YES;
    self.objectsPerPage = 25;
}

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        [self customInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self customInit];
    }
    return self;
}


-(PFQuery *) queryForTable
{
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    
    if(self.objects.count == 0)
    {
        query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    }
    
    [query orderByDescending:@"createdAt"];
    
    return query;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
                        object:(PFObject *)object {
    
    CatsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
    {
        //cell = [[CatsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell = (CatsTableViewCell *) [[NSBundle mainBundle] loadNibNamed:@"CatsTableViewCell" owner:self options:nil][0];
    }
    cell.catNameLabel.text = object[@"name"];
    cell.catCreditLabel.text = object[@"cc_by"];
    
    NSObject *votes = object[@"votes"];
    NSString *votesStr = [NSString stringWithFormat:@"%@",votes];
    cell.catVotesLabel.text = votesStr;
    
    NSString *urlStr = object[@"url"];
    NSURL *url = [[NSURL alloc] initWithString:urlStr];
    cell.catImageView.image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:url]];
    //[UIImage imageNamed:@"placeholder.jpg"];
    //cell.imageView.file = thumbnail;
    
    return cell;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 350;
    self.tableView.allowsSelection = false;
    [self.tableView registerNib:[UINib nibWithNibName:@"CatsTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellIdentifier];
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
