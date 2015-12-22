//
//  TableViewCellItem.h
//  FirstTestObjectC
//
//  Created by Douglas Barreto on 12/21/15.
//  Copyright © 2015 Douglas Barreto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCellItem : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumber;
@property (weak, nonatomic) IBOutlet UILabel *email;

@end
