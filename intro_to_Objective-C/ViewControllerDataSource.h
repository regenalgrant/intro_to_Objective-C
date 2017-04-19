//
//  ViewControllerDataSource.h
//  intro_to_Objective-C
//
//  Created by Regenal Grant on 4/17/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ViewControllerDataSource <NSObject>

@optional
-(void)optionalNumberOfItems:(int)number;

@required
-(void)requiredNumberForEachItem:(int)number;

@person
-(void)
@end
