//
//  DMBItem.h
//  RandomItems
//
//  Created by Douglas Barreto on 1/5/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMBItem : NSObject
{
    int _valueInDollars;
    NSString *_itemName;
    NSString *_serialNumber;
    NSDate *_dateCreated;
    
    __weak DMBItem *_containedItem;
    __weak DMBItem *_container;
}

@property (nonatomic, strong) DMBItem *containedItem;
@property (nonatomic, weak) DMBItem *container;
@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;

+(instancetype) randomItem;


-(instancetype) initWithItemName:(NSString *)name
                  valueInDollars:(int) value
                    serialNumber:(NSString *)sNumber;

-(instancetype)initWithItemName:(NSString *) name;


@end
