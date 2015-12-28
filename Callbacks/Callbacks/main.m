//
//  main.m
//  Callbacks
//
//  Created by Douglas Barreto on 12/28/15.
//  Copyright © 2015 Douglas Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DMBLogger.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        DMBLogger *logger = [[DMBLogger alloc] init];
        
        __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:logger selector:@selector(updateLastTime:) userInfo:nil repeats:YES];
        
        //This object is necessary when you want to be notified when a event occours
        // This little guy sit down and waits some event happens
        [[NSRunLoop currentRunLoop] run];
        
        
    }
    return 0;
}
