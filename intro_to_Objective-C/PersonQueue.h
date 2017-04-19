//
//  PersonQueue.h
//  intro_to_Objective-C
//
//  Created by Regenal Grant on 4/19/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;

@protocol PersonQueue <NSObject>

@required
-(void)enqueue: (Person*) aPerson;

@optional
- (int)count;

@end
