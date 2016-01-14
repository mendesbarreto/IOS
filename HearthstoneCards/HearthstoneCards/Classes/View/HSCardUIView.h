//
//  HSCardView.h
//  HearthstoneCards
//
//  Created by Douglas Barreto on 1/14/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

#import "HearthStone.h"
static int const kCardHeight = 465;
static int const kCardWidth = 307;

@interface HSCardUIView : UIView

@property (nonatomic, readonly) HSCard * cardInfo;
@property (nonatomic) UIImageView *image;

- (instancetype) initWithModel: (HSCard *) card;

@end
