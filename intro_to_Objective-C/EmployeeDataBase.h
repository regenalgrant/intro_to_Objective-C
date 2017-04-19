//
//  EmployeeDataBase.h
//  intro_to_Objective-C
//
//  Created by Regenal Grant on 4/18/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"

@interface EmployeeDataBase : NSObject

//Singleton
+(instancetype)shared;

-(NSInteger)count;
-(NSArray *)allEmployees;
-(Employee *)employeeAtIndex:(int)index;


-(void)add:(Employee *)employee;
-(void)remove:(Employee *)employee;
-(void)removeEmployeeAtIndex:(int)index;
-(void)removeAllEmployees;




@end
