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
        rect = CGRectMake( -(kCardWidth+100), kOffset.y, size.width, size.height);
        card.frame = rect;
        [self.view addSubview:card];
        [self.cards addObject:card];
    }
    
    
    float interval = 0;
    float offsetX = [self offsetXFrom:screenBounds.size cardNumber:numOfCards cardWidth:kCardWidth];
    __block float posX = 0;
    for( int i = 0; i < numOfCards; i++)
    {
        card = self.cards[i];
        //rect = card.frame;
        //        rect.origin.x = ;
        posX = (i * rect.size.width) + offsetX;
        NSLog(@"Position %i x: %f", i , posX);
        interval = i * 0.3;
        
        [UIView animateWithDuration:0.3 delay:interval options:0 animations:^{
            rect = CGRectMake(posX, card.frame.origin.y,card.frame.size.width , card.frame.size.height);
            card.frame = rect;
        } completion:^(BOOL finished) {
            
        }];
    }
    
    
}

-(float) offsetXFrom:(CGSize)screenSize
          cardNumber:(int)cardsQtd
           cardWidth:(float)w
{
    
    float offsetX = 0;
    float totalCardsWidth = cardsQtd * w;
    
    
    if( totalCardsWidth < screenSize.width )
    {
        float diff = fabs(screenSize.width - totalCardsWidth);
        offsetX = diff;
    }
    
    return (offsetX*0.5);
}

-(int) howManyCardsCouldBeDisplayedOnTheScreen
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    float w = screenBounds.size.width;
    
    int numberOfCards;
    
    if( kCardWidth > w)
        numberOfCards = 1;
    else
        numberOfCards = floorf(w / kCardWidth);
    
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
