//
//  Employee.m
//  intro_to_Objective-C
//
//  Created by Regenal Grant on 4/18/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import "EmployeeDataBase.h"


@implementation Employee

-(instancetype)initWithFirstName:(NSString *)firstName
                        lastName:(NSString *)lastName
                             age:(NSNumber *)age
                           email:(NSString *)email
                   yearsEmployed:(NSNumber *)yearsEmployed
                      andManager:(NSString *)managerName;
{

    self                    = [super initWithFirstName:firstName lastName:lastName andAge:age];

    if(self){
    _yearsEmployed          = [yearsEmployed retain];
    _managerName            = [managerName retain];
    _email                  = [email retain];
    _employeeNumber         = [NSNumber numberWithInt:arc4random_uniform(100)];
    }

    return self;

}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{

    self                    = [super init];

    if (self){

    self.firstName          = [aDecoder decodeObjectForKey:@"firstName"];
    self.lastName           = [aDecoder decodeObjectForKey:@"lastName"];
    self.age                = [aDecoder decodeObjectForKey:@"age"];
    self.yearsEmployed      = [aDecoder decodeObjectForKey:@"yearsEmployed"];
    self.managerName        = [aDecoder decodeObjectForKey:@"managerName"];
    self.employeeNumber     = [aDecoder decodeObjectForKey:@"employeeNumber"];
    self.email              = [aDecoder decodeObjectForKey:@"email"];

    }

    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.firstName forKey:@"firstName"];
    [aCoder encodeObject:self.lastName forKey:@"lastName "];
    [aCoder encodeObject:self.age forKey:@"age"];
    [aCoder encodeObject:self.managerName forKey:@"managerName"];
    [aCoder encodeObject:self.employeeNumber forKey:@"employeeNumber"];
    [aCoder encodeObject:self.email forKey:@"email"];
}


-(void)setEmail:(NSString *)email
{
    if (_email != email)
        [email retain];
        [_email release];
    _email                  = email;

}

-(void)setManagerName:(NSString *)managerName
{
    if (_managerName != managerName)
        [managerName retain];
        [_managerName release];
    _managerName            = managerName;
}

-(void)setYearsEmployed:(NSNumber *)yearsEmployed
{
    if (_yearsEmployed != yearsEmployed)
    [yearsEmployed retain];
    [_yearsEmployed release];
    _yearsEmployed          = yearsEmployed;
}

-(void)setEmployeeNumber:(NSNumber *)employeeNumber
{
    if (_employeeNumber != employeeNumber)
        [employeeNumber retain];
    [_employeeNumber release];
    _employeeNumber         = employeeNumber;
}




-(id)copyWithZone:(NSZone *)zone{
    Employee *employee      = [super copyWithZone:zone];

    employee.employeeNumber = self.employeeNumber;
    employee.managerName    = self.managerName;
    employee.yearsEmployed  = self.yearsEmployed;

    return employee;
}

@end
