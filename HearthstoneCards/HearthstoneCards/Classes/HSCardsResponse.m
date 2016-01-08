//
//  HSCardsResponse.m
//  HearthstoneCards
//
//  Created by Douglas Barreto on 1/8/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

#import "HSCardsResponse.h"
#import "HSCard.h"

@implementation HSCardsResponse


+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{  @"cards": @"Basic"};
}

+(NSValueTransformer *) BasicJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:HSCard.class];
}


@end
