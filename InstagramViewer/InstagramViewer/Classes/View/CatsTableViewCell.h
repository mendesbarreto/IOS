//
//  CatsTableViewCell.h
//  InstagramViewer
//
//  Created by Douglas Barreto on 12/30/15.
//  Copyright © 2015 Douglas Mendes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ParseUI/ParseUI.h>

@interface CatsTableViewCell : PFTableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *catImageView;
@property (weak, nonatomic) IBOutlet UILabel *catNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *catVotesLabel;
@property (weak, nonatomic) IBOutlet UILabel *catCreditLabel;


@end
