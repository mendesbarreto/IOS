//
//  DMBLogger.h
//  Callbacks
//
//  Created by Douglas Barreto on 12/28/15.
//  Copyright © 2015 Douglas Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMBLogger : NSTimer <NSURLConnectionDelegate, NSURLConnectionDataDelegate>
{
    NSMutableData *_incomingData;
}

@property (nonatomic) NSDate *lastTime;


-(NSString *) lastTimeString;
-(void)updateLastTime:(NSTimer *) t;
-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
-(void) connectionDidFinishLoading:(NSURLConnection *)connection;
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;
-(void) timeZoneChanged:(NSNotification *)note;

@end
