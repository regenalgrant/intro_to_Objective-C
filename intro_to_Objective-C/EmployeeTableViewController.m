//
//  EmployeeTableViewController.m
//  intro_to_Objective-C
//
//  Created by Regenal Grant on 4/19/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import "EmployeeTableViewController.h"
#import "EmployeeDataBase.h"

@interface EmployeeTableViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation EmployeeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.dataSource = self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EmployeeCell" forIndexPath:indexPath];
    
    cell.textLabel.text = @"hh";
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [[EmployeeDataBase shared] count];
}
@end
