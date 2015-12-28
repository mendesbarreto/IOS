//
//  DMBLogger.m
//  Callbacks
//
//  Created by Douglas Barreto on 12/28/15.
//  Copyright © 2015 Douglas Mendes. All rights reserved.
//

#import "DMBLogger.h"

@implementation DMBLogger
-(NSString *) lastTimeString
{
    static NSDateFormatter *dateFormatter = nil;
    
    if(!dateFormatter)
    {
        dateFormatter =[[NSDateFormatter alloc] init];
        if(!dateFormatter)
        {
            [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
            [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
            NSLog(@"Date formatter was created");
        }
    }
    
    return [dateFormatter stringFromDate:self.lastTime];
}

-(void) updateLastTime:(NSTimer *)t
{
    NSDate *now = [NSDate date];
    [self setLastTime:now];
    NSLog(@"Just set time  to %@ \n ", self.lastTimeString);
}

@end
