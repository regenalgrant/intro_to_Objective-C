//
//  EmployeeTableViewController.m
//  intro_to_Objective-C
//
//  Created by Regenal Grant on 4/19/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import "EmployeeTableViewController.h"
#import "EmployeeDataBase.h"
#import "Employee.h"

@interface EmployeeTableViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation EmployeeTableViewController



//- (void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    [self.tableView reloadData];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.dataSource = self;
    [[EmployeeDataBase shared] addObserver:self forKeyPath:@"employees" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew | NSKeyValueChangeInsertion | NSKeyValueChangeRemoval context:nil];

}



//Employee *firstEmployee = [[Employee alloc] initWithFirstName:@"Cathy" lastName:@"Oun" age:@25 email:@"cathy@mac.com" yearsEmployed:@2 andManager:@"Adam"];
//
//Employee *secondEmployee = [[Employee alloc] initWithFirstName:@"Jesus" lastName:@"Christ" age:@25 email:@"JesusChrist@mac.com" yearsEmployed:@2 andManager:@"God"];
//
//Employee *thirdEmployee = [[Employee alloc] initWithFirstName:@"Xcode" lastName:@"Xman" age:@2 email:@"GonnaGiveItToYou@mac.com" yearsEmployed:@2 andManager:@"IDontKnow"];
//
//[[EmployeeDataBase shared] add:firstEmployee];
//[[EmployeeDataBase shared] add:secondEmployee];
//[[EmployeeDataBase shared] add:thirdEmployee];


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {

    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[EmployeeDataBase shared] removeEmployeeAtIndex:(int)indexPath.row];
        [self.tableView reloadData];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell     = [tableView dequeueReusableCellWithIdentifier:@"EmployeeCell" forIndexPath:indexPath];

    NSArray *allEmployees     = [[EmployeeDataBase shared] allEmployees];
    Employee *employee        = allEmployees[indexPath.row];

    cell.textLabel.text       = employee.firstName;

    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [[EmployeeDataBase shared] count];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"employees"]) {
        [self.tableView reloadData];
    }
}

-(void)dealloc{
    [[EmployeeDataBase shared] removeObserver:self forKeyPath:@"employees"];
}

@end
