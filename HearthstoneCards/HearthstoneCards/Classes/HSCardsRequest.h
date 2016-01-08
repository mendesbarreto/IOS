//
//  HSCardsRequest.h
//  HearthstoneCards
//
//  Created by Douglas Barreto on 1/8/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface HSCardsRequest : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) NSNumber *attack;
@property (nonatomic, strong) NSNumber *collectible;
@property (nonatomic, strong) NSNumber *cost;
@property (nonatomic, strong) NSNumber *durability;
@property (nonatomic, strong) NSNumber *health;


@property (nonatomic, copy) NSString *callback;
@property (nonatomic, copy) NSString *locale;

@end
