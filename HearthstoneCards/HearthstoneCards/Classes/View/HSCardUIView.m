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
    self = [super initWithFrame:CGRectMake(kOffset.x, kOffset.y, kCardWidth, kCardHeight)];
    if(self)
    {
        _cardInfo = card;
        [self loadCardImage];
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

- (void) udpateCard: (HSCard * _Nullable) card {
    assert("You should implement this method");
}


- (void) loadCardImage{
    if(self.image){
        //Removint the image form a super view for no memory lick
        [self.image removeFromSuperview];
    }
    
    if (self.cardInfo) {
        NSURL *url = [NSURL URLWithString:self.cardInfo.imgUrl];
        self.image = [[UIImageView alloc] init];
        [self.image sd_setImageWithURL:url];
        [self setUpImage];
        [self addSubview:self.image];
    }else{
        [NSException raise:@"HSCardUIView Problem!" format:@"The information card not exists or %@", self.cardInfo];
    }
}

-(void) setUpImage{
    if(self.image){
        self.image.contentMode = UIViewContentModeScaleAspectFill;
        self.image.frame = CGRectMake(0,0, kCardWidth, kCardHeight);
    }
}

- (NSLayoutConstraint *)pin:(id)item attribute:(NSLayoutAttribute)attribute parent:(UIView *) uiComponent
{
    return [NSLayoutConstraint constraintWithItem:uiComponent
                                        attribute:attribute
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:item
                                        attribute:attribute
                                       multiplier:1.0
                                         constant:0.0];
}

/*@! @brief This method attachs the FDCShotUIView uiComponent*/
- (void)addConstraintOn:(UIView *) uiComponent toItem: (UIView *) parent {
    
    uiComponent.translatesAutoresizingMaskIntoConstraints = NO;
    
    [parent addConstraint:[self pin:uiComponent  attribute:NSLayoutAttributeTop parent:parent]];
    [parent addConstraint:[self pin:uiComponent  attribute:NSLayoutAttributeLeft parent:parent]];
    [parent addConstraint:[self pin:uiComponent  attribute:NSLayoutAttributeBottom parent:parent]];
    [parent addConstraint:[self pin:uiComponent  attribute:NSLayoutAttributeRight parent:parent]];
}


/*@! @brief This method attachs the FDCShotUIView uiComponent*/
- (void)constraintTo:(UIView *) uiComponent {
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    [uiComponent addConstraint:[self pin:self  attribute:NSLayoutAttributeTop parent:uiComponent]];
    [uiComponent addConstraint:[self pin:self  attribute:NSLayoutAttributeLeft parent:uiComponent]];
    [uiComponent addConstraint:[self pin:self  attribute:NSLayoutAttributeBottom parent:uiComponent]];
    [uiComponent addConstraint:[self pin:self  attribute:NSLayoutAttributeRight parent:uiComponent]];
}


@end
