//
//  DemoTableViewController.m
//  iOS7TableViewProblem
//
//  Created by Matt Glover on 25/09/2013.
//  Copyright (c) 2013 Duchy Software Ltd. All rights reserved.
//

#import "DemoTableViewController.h"
#import "StaffNameTableViewCell.h"
#import "ProjectTableViewCell.h"

#import "StaffService.h"
#import "Staff.h"
#import "Project.h"

static NSString * const kStaffCellNibName    = @"StaffNameTableViewCell";
static NSString * const kStaffCellIdentifier = @"StaffNameCellIdentifier";
static NSString * const kProjectCellNibName    = @"ProjectTableViewCell";
static NSString * const kProjectCellIdentifier = @"ProjectCellIdentifier";

#define CELL_HEIGHT_CLOSED 120.0f
#define CELL_HEIGHT_OPEN   240.0f

@interface DemoTableViewController ()<UITableViewDataSource, UITableViewDelegate, StaffNameTableViewCellDelegate>

@property (nonatomic, strong) NSArray *staff;
@property (nonatomic, strong) NSMutableArray *tableData;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSIndexPath *selectedIndexPath;

@property (nonatomic, strong) UITableView *nameInitialsTableView;

@end

@implementation DemoTableViewController

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    StaffService *staffService = [[StaffService alloc] init];
    self.staff = staffService.staff;
    
    self.tableData = [NSMutableArray array];
    [_tableData addObjectsFromArray:self.staff];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self registerNibs];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - Setup
- (void)registerNibs {
    [self.tableView registerNib:[UINib nibWithNibName:kStaffCellNibName bundle:nil] forCellReuseIdentifier:kStaffCellIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:kProjectCellNibName bundle:nil] forCellReuseIdentifier:kProjectCellIdentifier];
}

#pragma mark - UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    
    id item = _tableData[indexPath.row];
    
    if ([item isKindOfClass:[Staff class]]) {
        cell = (StaffNameTableViewCell *) [tableView dequeueReusableCellWithIdentifier:kStaffCellIdentifier forIndexPath:indexPath];
        if ([cell respondsToSelector:@selector(setDelegate:)]) {
            [cell performSelector:@selector(setDelegate:) withObject:self];
        }
        [self configureStaffNameCell:cell staff:_tableData[indexPath.row]];
    }
    
    if ([item isKindOfClass:[Project class]]) {
        cell = (ProjectTableViewCell *) [tableView dequeueReusableCellWithIdentifier:kProjectCellIdentifier forIndexPath:indexPath];
        [self configureProjectNameCell:cell project:_tableData[indexPath.row]];
    }
    
    if ([cell respondsToSelector:@selector(setDelegate:)]) {
        [cell performSelector:@selector(setDelegate:) withObject:self];
    }
    [cell setClipsToBounds:YES];
    
    return cell;
}

- (void)configureStaffNameCell:(UITableViewCell *)cell staff:(Staff *)staff {
    StaffNameTableViewCell *staffTableViewCell = (StaffNameTableViewCell *)cell;
    [staffTableViewCell.staffNameLabel setText:staff.name];
}

- (void)configureProjectNameCell:(UITableViewCell *)cell project:(Project *)project {
    ProjectTableViewCell *projectTableViewCell = (ProjectTableViewCell *)cell;
    [projectTableViewCell.projectNameLabel setText:project.name];
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
    
    [tableView beginUpdates];
    
    if (!self.selectedIndexPath || indexPath.row != self.selectedIndexPath.row ) {
        self.selectedIndexPath = indexPath;
    } else {
        self.selectedIndexPath = nil;
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    
    [tableView endUpdates];
}

- (void)updateTableView:(UITableView *)tableView {
    [tableView beginUpdates];
    [tableView endUpdates];
}

#pragma mark - StaffNameTableViewCell Delegate
- (void)staffNameTableCellDidSelectCancel:(StaffNameTableViewCell *)cell{
    NSLog(@"Cancel");
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    self.selectedIndexPath = nil;
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self updateTableView:self.tableView];
}

- (void)staffNameTableCellDidSelectCall:(StaffNameTableViewCell *)cell{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    Staff *staffMember = self.staff[indexPath.row];
    NSLog(@"Call : %@", staffMember.name);
}

- (void)staffNameTableCellDidSelectPage:(StaffNameTableViewCell *)cell {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    Staff *staffMember = self.staff[indexPath.row];
    NSLog(@"Page : %@", staffMember.name);
}

@end
