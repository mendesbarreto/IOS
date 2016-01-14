//
//  HSCardBoardViewController.m
//  HearthstoneCards
//
//  Created by Douglas Barreto on 1/12/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

#import "HearthStone.h"

@interface HSCardBoardViewController ()

@end

@implementation HSCardBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    self.cards = [NSMutableArray new];
    HSCard *carInfo = [[HSCard alloc] init];
    carInfo.imgUrl = @"http://wow.zamimg.com/images/hearthstone/cards/enus/original/EX1_409.png";
    
    __block CGRect rect;
    CGSize size;
    
    int numOfCards = [self howManyCardsCouldBeDisplayedOnTheScreen];
    
    HSCardUIView* card;
    for(int i = 0; i < numOfCards; i++)
    {
        card = [[HSCardUIView alloc] initWithModel:carInfo];
        size = card.frame.size;
        rect = CGRectMake( -(kCardWidth + 100), kOffset.y, size.width, size.height);
        card.frame = rect;
        [self.view addSubview:card];
        [self.cards addObject:card];
    }
    
    
    float interval = 0;
    for( int i = 0; i < numOfCards; i++)
    {
        card = self.cards[i];
        rect = card.frame;
        rect.origin.x = i * rect.size.width;
        interval = i * 0.3;
        
        
        [UIView animateWithDuration:0.3 delay:interval options:0 animations:^{
            card.frame = rect;
        } completion:^(BOOL finished) {
            
        }];
        //        [UIView animateWithDuration:2.0 animations:^{
        //            card.frame = rect;
        //        }];
    }
    
    
}


-(int) howManyCardsCouldBeDisplayedOnTheScreen
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    float w = screenBounds.size.width;
    
    int numberOfCards;
    
    if( kCardWidth > w)
        numberOfCards = 1;
    else
        numberOfCards = ceil(w / kCardWidth);
    
    return numberOfCards;
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
