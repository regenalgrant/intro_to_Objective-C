//
//  EmployeeDataBase.m
//  intro_to_Objective-C
//
//  Created by Regenal Grant on 4/18/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//


#import "EmployeeDataBase.h"
#import "Employee.h"

@interface EmployeeDataBase ()

@property (strong, nonatomic) NSMutableArray *employees;


@end

@implementation EmployeeDataBase

+(instancetype)shared{
    //must "nil" out or have memory leak a previous shared
    //Singleton in Objective C
    static EmployeeDataBase *shared = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    shared                          = [[[self class] alloc]init];
    });

    return shared;

}

-(instancetype)init{
    self                            = [super init];
    if (self) {
    _employees                      = [NSKeyedUnarchiver unarchiveObjectWithData:[NSData dataWithContentsOfURL:self.archiveURL]];
        if (!_employees){
    _employees                      = [[NSMutableArray alloc]init];
        }
    }
    return self;
}

-(NSInteger)count{
    return self.employees.count;
}

-(NSArray *)allEmployees{
    return self.employees;
}

-(Employee *)employeeAtIndex:(int)index{
    return [self.employees objectAtIndex:index];
}


-(void)add:(Employee *)employee{
    [self.employees addObject:employee];
    [self save];
}

-(void)remove:(Employee *)employee{
    [self.employees removeObject:employee];
    [self save];
}


-(void)removeEmployeeAtIndex:(int)index{
    [self.employees removeObjectAtIndex:index];
    [self save];

}
-(void)removeAllEmployees{
    [self.employees removeAllObjects];
    [self save];
}


-(void)save{
    [self willChangeValueForKey:@"employees"];
    BOOL success                    = [NSKeyedArchiver archiveRootObject:self.employees toFile:[self archiveURL].path];

    if (success){
        NSLog(@"saved Employees");
    } else {
        NSLog(@"save Failed!");
    }
    [self didChangeValueForKey:@"employees"];
}

+ (BOOL)automaticallyNotifiesObserversOfEmployees{
    return NO;
}

//MARK: Helper Methods
-(NSURL *)documentDirectory {
    NSURL *documentDirectoryURL     = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:
                                    NSUserDomainMask] firstObject];

    return documentDirectoryURL;

}

-(NSURL *)archiveURL {
    return [[self documentDirectory] URLByAppendingPathComponent:@"archive"];
}

@end
