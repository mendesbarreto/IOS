//
//  HSCardsResponse.h
//  HearthstoneCards
//
//  Created by Douglas Barreto on 1/8/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface HSCardsResponse : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSArray *cards;


@end
