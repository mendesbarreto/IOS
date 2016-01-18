//
//  HSCardBoardViewController.h
//  HearthstoneCards
//
//  Created by Douglas Barreto on 1/12/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSCardBoardViewController : UIViewController

@property (nonatomic) NSMutableArray *cards;

-(float) offsetXFrom:(CGSize)screenSize
          cardNumber:(int)cardsQtd
           cardWidth:(float)w;

@end
