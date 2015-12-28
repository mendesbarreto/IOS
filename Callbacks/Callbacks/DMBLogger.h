//
//  DMBLogger.h
//  Callbacks
//
//  Created by Douglas Barreto on 12/28/15.
//  Copyright © 2015 Douglas Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMBLogger : NSTimer
@property (nonatomic) NSDate *lastTime;
-(NSString *) lastTimeString;
-(void)updateLastTime:(NSTimer *) t;


@end
