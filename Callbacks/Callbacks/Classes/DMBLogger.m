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

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"The data was received %lu bytes \n ", [data length]);
    
    if(!_incomingData)
    {
        _incomingData = [[NSMutableData alloc] init];
        
    }
    
    [_incomingData appendData:data];
}


-(void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"The data was loaded with %lu bytes", (unsigned long)[_incomingData length]);
    
    NSString *str = [[NSString alloc] initWithData:_incomingData encoding:NSUTF8StringEncoding];
    NSLog(@"string has %lu character \n", [str length]);
    NSLog(@"string content \n %@ \n", str);
    
    _incomingData = nil;
}

-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"connection failed: %@", [error localizedDescription]);
    _incomingData = nil;
}

-(void) timeZoneChanged:(NSNotification *)note
{
    NSLog(@"The time change");
}

@end
