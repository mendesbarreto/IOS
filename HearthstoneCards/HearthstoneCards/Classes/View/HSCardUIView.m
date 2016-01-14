//
//  HSCardView.m
//  HearthstoneCards
//
//  Created by Douglas Barreto on 1/14/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

#import "HSCardUIView.h"

@implementation HSCardUIView

- (instancetype) initWithModel: (HSCard *) card {
    self = [super initWithFrame:CGRectMake(0, 0, kCardWidth, kCardHeight)];
    if(self)
    {
        _cardInfo = card;
    }
    return self;
}





/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */



@end
