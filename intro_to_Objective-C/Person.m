//
//  Person.m
//  intro_to_Objective-C
//
//  Created by Regenal Grant on 4/17/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//
#import "ViewController.h"
#import "Person.h"

@implementation Person

-(instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                           andAge:(NSNumber *)age{
    self = [super init];
    if (self){
        _firstName = firstName;
        _lastName = lastName;
        _age = age;
        
    }
    return self;
    
}

-(id)copyWithZone:(NSZone *)zone{
    Person *person = [[[self class] alloc]init];

    person.firstName = self.firstName;
    person.lastName = self.lastName;
    person.age = self.age;

    return person;

}

@end














