//
//  main.m
//  Stringz
//
//  Created by Douglas Barreto on 12/23/15.
//  Copyright © 2015 Douglas Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableString *str = [[NSMutableString alloc] init];
        
        for( int i = 0; i < 100; ++i )
        {
            [str appendString:@"God is Cool ! \n"];
        }
        
        
        NSError *error;
        
        NSString *textFileString = [[NSString alloc] initWithContentsOfFile:@"/Users/douglas/Documents/cool.text" encoding:NSASCIIStringEncoding error:&error];
        
        if(!str)
        {
            NSLog(@"The file could not be open cause: %@", [error localizedDescription]);
        }
        else
        {
            NSLog(@"%@",textFileString );
        }
        
        /*
         NSError *error;
         
         BOOL sucess = [str writeToFile:@"/Users/douglas/Documents/cool.text" atomically:YES encoding:NSUTF8StringEncoding error:&error];
         
         
         if(sucess)
         NSLog(@"The file was created"   );
         else
         NSLog(@"The file could not be created: %@",[error localizedDescription]);
         */
        return 0;
    }
}
