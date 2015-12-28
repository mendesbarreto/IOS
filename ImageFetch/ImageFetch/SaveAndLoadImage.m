//
//  SaveAndLoadImage.m
//  ImageFetch
//
//  Created by Douglas Barreto on 12/28/15.
//  Copyright © 2015 Douglas Mendes. All rights reserved.
//

#import "SaveAndLoadImage.h"

@implementation SaveAndLoadImage

- (void) getAndSaveImageFromUrl: (NSString *) urlStr AndSave:(NSString *) path
{
    // insert code here...
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error  ];
    
    if(!data)
    {
        NSLog(@"fetch failed: %@", [error localizedDescription]);
    }
    else
    {
        NSLog(@"The file is %lu bytes", (unsigned long) [data length]);
        
        BOOL written = [data writeToFile:path options:0 error:&error];
        if(!written)
        {
            NSLog(@"Problem to save the image file: %@", [error localizedDescription]);
        }
        NSLog(@"Success");
    }
}

- (NSData *) loadFileFromPath: (NSString * ) path
{
    NSError *error= nil;
    NSData *data = [NSData dataWithContentsOfFile:path options:0 error:&error];
    
    
    if(!data)
    {
        NSLog(@"Data could not be loaded %@", [error localizedDescription]);
    }
    else
        NSLog(@"File loaded with: %lu bytes \n", (unsigned long)[data length]);
    
    return data;
}

@end
