//
//  Person.h
//  intro_to_Objective-C
//
//  Created by Regenal Grant on 4/17/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//
#import <Foundation/Foundation.h>


@interface Person : NSObject<NSCopying>

@property(retain, nonatomic) NSString *firstName, *lastName;
@property(retain, nonatomic) NSNumber *age;


-(instancetype)initWithFirstName:(NSString *)firstName
                        lastName:(NSString *)lastName
                          andAge:(NSNumber *)age;





@end
