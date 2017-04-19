//
//  Queue.m
//  intro_to_Objective-C
//
//  Created by Regenal Grant on 4/19/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import "Queue.h"
#import "Person.h"

@implementation Queue {
    
    NSMutableArray *entries;
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        entries = [NSMutableArray array];
        
    }
    
    return self;
    
}

-(void)enqueue: (Person*)aPerson {
    [entries addObject:aPerson];
}

-(Person *)dequeue {
    if (entries.count == 0) {return NULL;}

    Person* person = [entries firstObject];
    [entries removeObjectAtIndex: 0];

    return person;
}

-(int) count{
    return (int) entries.count;
}

-(void) printNames {
    for (Person *person in entries) {
        NSLog(@"%@", person);
    }
}


@end
