//
//  BNREmployee.h
//  TimeAfterTIme
//
//  Created by Douglas Barreto on 12/23/15.
//  Copyright © 2015 Douglas Mendes. All rights reserved.
//

#import "BNRPerson.h"

@interface BNREmployee : BNRPerson
@property (nonatomic) unsigned int employeeID;
@property (nonatomic) unsigned int officeAlarmCode;
@property (nonatomic) NSDate *hireDate;

-(double) yearsOfEmployment;

@end
