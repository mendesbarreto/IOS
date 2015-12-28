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
        
        
        /* Remove this comment to see delegte example
         NSURL *url = [NSURL URLWithString:@"http://www.gutenberg.org/cache/epub/205/pg205.txt"];
         NSURLRequest *request = [NSURLRequest requestWithURL:url];
         __unused NSURLConnection *fetchConn = [[NSURLConnection alloc] initWithRequest:request delegate:logger startImmediately:YES];
         */
        
        /* Remove the comment to test the events
         __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:logger selector:@selector(updateLastTime:) userInfo:nil repeats:YES];
         */
        
        /*
         
         [[NSNotificationCenter defaultCenter] addObserver:logger selector:@selector(timeZoneChanged:) name:NSSystemTimeZoneDidChangeNotification object:nil];
         */
        
        //This object is necessary when you want to be notified when a event occours
        // This little guy sit down and waits some event happens
        [[NSRunLoop currentRunLoop] run];
        
        
    }
    return 0;
}
