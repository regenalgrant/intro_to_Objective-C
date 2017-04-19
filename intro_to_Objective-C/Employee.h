//
//  Employee.h
//  intro_to_Objective-C
//
//  Created by Regenal Grant on 4/18/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"


@interface Employee : Person <NSCopying, NSCoding>

@property(strong, nonatomic) NSNumber *employeeNumber, *yearsEmployed;
@property(strong, nonatomic) NSString *managerName;
@property(strong, nonatomic) NSString *email;


-(instancetype)initWithFirstName:(NSString *)firstName
                        lastName:(NSString *)lastName
                             age:(NSNumber *)age
                           email:(NSString *)email
                   yearsEmployed:(NSNumber *)yearsEmployed
                      andManager:(NSString *)managerName;

@end
