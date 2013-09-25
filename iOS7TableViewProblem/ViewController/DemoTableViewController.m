//
//  DemoTableViewController.m
//  iOS7TableViewProblem
//
//  Created by Matt Glover on 25/09/2013.
//  Copyright (c) 2013 Duchy Software Ltd. All rights reserved.
//

#import "DemoTableViewController.h"
#import "StaffNameTableViewCell.h"

static NSString * const kStaffCellNibName    = @"StaffNameTableViewCell";
static NSString * const kStaffCellIdentifier = @"StaffNameCellIdentifier";

#define CELL_HEIGHT_CLOSED 120.0f
#define CELL_HEIGHT_OPEN   240.0f

@interface DemoTableViewController ()<UITableViewDataSource, UITableViewDelegate, StaffNameTableViewCellDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSIndexPath *selectedIndexPath;

@property (nonatomic, strong) NSArray *staffNames;
@end

@implementation DemoTableViewController

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.staffNames = @[@"Tom",
                        @"Liam",
                        @"Ken",
                        @"Matt",
                        @"Paul",
                        @"Lawrence",
                        @"Jack",
                        @"Jill",
                        @"James",
                        @"John",
                        @"Juliet"];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self registerNibs];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - Setup
- (void)registerNibs {
    [self.tableView registerNib:[UINib nibWithNibName:kStaffCellNibName bundle:nil] forCellReuseIdentifier:kStaffCellIdentifier];
}

#pragma mark - UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.staffNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    StaffNameTableViewCell *cell = (StaffNameTableViewCell *) [tableView dequeueReusableCellWithIdentifier:kStaffCellIdentifier forIndexPath:indexPath];
    [cell setClipsToBounds:YES];
    [cell setDelegate:self];
    [self configureStaffNameCell:cell staffName:self.staffNames[indexPath.row]];
    
    return cell;
}

- (void)configureStaffNameCell:(StaffNameTableViewCell *)cell staffName:(id)staffName {
    NSString *name = (NSString *)staffName;
    [cell.staffNameLabel setText:name];
}

#pragma mark - UITableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (!self.selectedIndexPath) {
        return CELL_HEIGHT_CLOSED;
    }
    
    CGFloat height = (indexPath.row == _selectedIndexPath.row) ? CELL_HEIGHT_OPEN : CELL_HEIGHT_CLOSED;
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (!self.selectedIndexPath || indexPath.row != self.selectedIndexPath.row ) {
        self.selectedIndexPath = indexPath;
    } else {
        self.selectedIndexPath = nil;
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    
    [self updateTableView:tableView];
}

- (void)updateTableView:(UITableView *)tableView {
    [tableView beginUpdates];
    [tableView endUpdates];
}

#pragma mark - StaffNameTableViewCell Delegate
- (void)staffNameTableCellDidSelectCancel:(StaffNameTableViewCell *)cell{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    self.selectedIndexPath = nil;
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self updateTableView:self.tableView];
}

- (void)staffNameTableCellDidSelectCall:(StaffNameTableViewCell *)cell{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    NSString *name = self.staffNames[indexPath.row];
    NSLog(@"Call : %@", name);
}

- (void)staffNameTableCellDidSelectPage:(StaffNameTableViewCell *)cell {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    NSString *name = self.staffNames[indexPath.row];
    NSLog(@"Page : %@", name);
}

@end
