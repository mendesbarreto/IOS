//
//  main.m
//  RandomItems
//
//  Created by Douglas Barreto on 1/5/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMBItem.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *items = [[NSMutableArray alloc]init];
        DMBItem *item;
        
        int lenght = 30;
        //        for (int i = 0; i < lenght; i++)
        //        {
        //            item = [DMBItem randomItem];
        //            [items addObject:item];
        //            
        //            if( i > 0 )
        //            {
        //                [item setContainer:items[--i]];
        //            }
        //        }
        
        
        DMBItem *backpack = [[DMBItem alloc] initWithItemName:@"Backpack"];
        [items addObject:backpack];
        
        DMBItem *calculator = [[DMBItem alloc] initWithItemName:@"Calculator"];
        [items addObject:calculator];
        
        backpack.containedItem = calculator;
        backpack = nil;
        calculator = nil;
        
        
        items = nil;
    }
    return 0;
}
