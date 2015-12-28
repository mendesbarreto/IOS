//
//  main.m
//  ImageFetch
//
//  Created by Douglas Barreto on 12/28/15.
//  Copyright © 2015 Douglas Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSURL *url = [NSURL URLWithString:@"http://images.idiva.com/media/luxury/photogallery/2013/Jun/10-best-islands-in-the-world_600x450.jpg"];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSError *error = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error  ];
        
        if(!data)
        {
            NSLog(@"fetch failed: %@", [error localizedDescription]);
            return 1;
        }
        else
        {
            NSLog(@"The file is %lu bytes", (unsigned long) [data length]);
            
            BOOL written = [data writeToFile:@"/Users/douglas/Documents/background.jpg" options:0 error:&error];
            
            if(!written)
            {
                NSLog(@"Problem to save the image file: %@", [error localizedDescription]);
                return 1;
            }
            
            
            NSLog(@"Success");
        }
        
    }
    return 0;
}
