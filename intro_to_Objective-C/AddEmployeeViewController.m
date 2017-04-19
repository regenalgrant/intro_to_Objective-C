//
//  AddEmployeeViewController.m
//  intro_to_Objective-C
//
//  Created by Regenal Grant on 4/19/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import "AddEmployeeViewController.h"
#import "Employee.h"
#import "EmployeeDataBase.h"


@interface AddEmployeeViewController ()

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *ageTextfield;
@property (weak, nonatomic) IBOutlet UITextField *emailTextfield;

@property (weak, nonatomic) IBOutlet UITextField *yearsEmploymentTextfield;
@property (weak, nonatomic) IBOutlet UITextField *managerEmployeeTextfield;


@end

@implementation AddEmployeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)saveButtonPressed:(id)sender {
    // Convert NSString to NSNumber for age and yearsEmployed
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *age = [formatter numberFromString: self.ageTextfield.text];
    NSNumber *yearsEmployed = [formatter numberFromString: self.yearsEmploymentTextfield.text];

    Employee *employee = [[Employee alloc]initWithFirstName:self.firstNameTextfield.text
                                                   lastName:self.lastNameTextfield.text
                                                        age:age
                                                      email:self.emailTextfield.text
                                              yearsEmployed:yearsEmployed
                                                 andManager:self.managerEmployeeTextfield.text];
    
    [[EmployeeDataBase shared] add:employee];
    [self dismissViewControllerAnimated:true completion:nil];
    
}
- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}



@end
