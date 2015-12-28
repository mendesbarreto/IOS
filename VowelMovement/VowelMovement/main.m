//
//  main.m
//  VowelMovement
//
//  Created by Douglas Barreto on 12/28/15.
//  Copyright © 2015 Douglas Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ArrayEnumerationWithoutVowels)(id, NSUInteger, BOOL *);


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray *orignalStrings = @[@"Sauerkraut", @"Douglas", @"EndUP", @"Hello"];
        NSLog(@"Orignal Strings: %@ \n", orignalStrings);
        
        NSMutableArray *mutable = [NSMutableArray array];
        NSArray *vowels = @[@"a", @"e", @"i", @"o", @"u"];
        //void (^devowelizer)(id, NSUInteger, BOOL *);
        
        
        ArrayEnumerationWithoutVowels devowelizer = ^(id string , NSUInteger i, BOOL *stop)
        {
            NSMutableString *newString = [NSMutableString stringWithString:string];
            
            for(NSString *s in vowels)
            {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString replaceOccurrencesOfString:s
                                           withString:@""
                                              options:NSCaseInsensitiveSearch
                                                range:fullRange];
                
            }
            
            [mutable addObject:newString];
        };
        
        [orignalStrings enumerateObjectsUsingBlock:devowelizer];
        
        
        NSLog(@"New strings: %@ \n", mutable);
        
    }
    return 0;
}
