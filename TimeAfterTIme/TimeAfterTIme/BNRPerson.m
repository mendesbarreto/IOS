//
//  BNRPerson.m
//  TimeAfterTIme
//
//  Created by Douglas Barreto on 12/23/15.
//  Copyright © 2015 Douglas Mendes. All rights reserved.
//

#import "BNRPerson.h"

@interface BNRPerson()

@property (nonatomic) unsigned int officeAlarmCode;

@end


@implementation BNRPerson

- (float)bodyMassIndex{
    
    
    return _weightInKilos / (_heightInMeters * _heightInMeters);
}

@end
