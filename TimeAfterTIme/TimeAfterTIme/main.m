//
//  main.m
//  TimeAfterTIme
//
//  Created by Douglas Barreto on 12/23/15.
//  Copyright © 2015 Douglas Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Create three NSDate objects
        BNRPerson *person = [[BNRPerson alloc] init];
        
        person.weightInKilos = 30;
        
        [person setHeightInMeters:1.62];
        [person setWeightInKilos:52];
        
        NSLog(@"This person has H: %.2f and W: %i ", [person heightInMeters], [person weightInKilos]);
    }
    return 0;
}
