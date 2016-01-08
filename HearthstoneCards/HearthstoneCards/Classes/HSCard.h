//
//  HSCard.h
//  HearthstoneCards
//
//  Created by Douglas Barreto on 1/8/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface HSCard : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *cardID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *cardSet;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *imgUrl;
@property (nonatomic, copy) NSString *imgGoldUrl;
@property (nonatomic, copy) NSString *locale;


@property (nonatomic, assign) NSNumber *cost;
@property (nonatomic, assign) NSNumber *attack;
@property (nonatomic, assign) BOOL elite;

@end
