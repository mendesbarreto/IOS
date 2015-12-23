//
//  BNRPerson.h
//  TimeAfterTIme
//
//  Created by Douglas Barreto on 12/23/15.
//  Copyright © 2015 Douglas Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(char, BlenderSpeed)
{
    BlenderSpeedStir,
    BlenderSpeedChop,
    BlenderSpeedLiquify
};

@interface BNRPerson : NSObject

@property (nonatomic) float heightInMeters;
@property (nonatomic) int weightInKilos;

-(float)heightInMeters;
-(int)weightInKilos;
-(float)bodyMassIndex;

@end
