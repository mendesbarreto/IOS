//
//  HSCard.m
//  HearthstoneCards
//
//  Created by Douglas Barreto on 1/8/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

#import "HSCard.h"

@implementation HSCard

+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"cardID": @"cardId",
             @"name": @"name Hex",
             @"cardSet": @"cardSet",
             @"type": @"type",
             @"text": @"text",
             @"imgUrl": @"img",
             @"imgGoldUrl": @"imgGold",
             @"locale": @"locale",
             @"cost": @"cost",
             @"attack": @"attack",
             @"health": @"health",
             @"elite": @"elite"};
}

/*
 
 ,
 
 */

@end
