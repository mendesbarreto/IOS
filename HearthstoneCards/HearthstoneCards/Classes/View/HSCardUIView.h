//
//  HSCardView.h
//  HearthstoneCards
//
//  Created by Douglas Barreto on 1/14/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

#import "HearthStone.h"

static float const kCardHeight = 233;
static float const kCardWidth = 154;
static const CGPoint kOffset = {0, 80.0f};

@interface HSCardUIView : UIView

@property (nonatomic, readonly) HSCard *cardInfo;
@property (nonatomic) UIImageView *image;

/*! @brief When you init the HSCardUIView with this funciton the cards information and image will be diplayed auto*/
- (instancetype) initWithModel: (HSCard *) card;

/*! @brief updates and reload image in the view, case  the user pass a new model all information will be reloaded*/
- (void) udpateCard: (HSCard * _Nullable) card;

- (NSLayoutConstraint *)pin:(id)item attribute:(NSLayoutAttribute)attribute parent:(UIView *) uiComponent;
- (void)constraintTo:(UIView *) uiComponent;

@end
