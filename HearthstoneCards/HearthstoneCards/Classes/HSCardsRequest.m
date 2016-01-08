//
//  HSCardsRequest.m
//  HearthstoneCards
//
//  Created by Douglas Barreto on 1/8/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

#import "HSCardsRequest.h"

@implementation HSCardsRequest

#pragma mark - Mantle JSONKeyPathsByPropertyKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"attack": @"attack",
             @"callback": @"callback",
             @"collectible": @"collectible",
             @"cost": @"cost",
             @"durability": @"durability",
             @"health": @"health",
             @"locale": @"locale"
             };
}


@end
