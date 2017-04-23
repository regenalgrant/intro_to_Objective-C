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
    self             = [super init];
    if (self){

        //retain is used at the bottom of the code(page)//

    _firstName       = firstName;
    _lastName        = lastName;
    _age             = age;

        //do not need retained//

        //        _firstName = [firstName retain];
        //        _lastName = [lastName retain];
        //        _age = [age retain];

    }
    return self;

}

-(void)setFirstName:(NSString *)firstName{
    if (_firstName != firstName){
        [firstName retain];
        [_firstName release];
    _firstName       = firstName;
    }

}

-(void)setLastName:(NSString *)lastName{
    if (_lastName != lastName){
        [lastName retain];
        [_lastName release];
    _lastName        = lastName;
    }
}

-(void)setAge:(NSNumber *)age{
    if (_age != age){
        [age retain];
        [_age release];
    _age             = age;
    }

}

-(id)copyWithZone:(NSZone *)zone{
    Person *person   = [[[self class] alloc]init];

    person.firstName = self.firstName;
    person.lastName  = self.lastName;
    person.age       = self.age;

    return person;

}
-(void)dealloc{
    [_firstName release];
    [_lastName release];
    [_age release];
    [super dealloc];
}
@end














