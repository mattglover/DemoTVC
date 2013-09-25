//
//  StaffService.m
//  iOS7TableViewProblem
//
//  Created by Matt Glover on 25/09/2013.
//  Copyright (c) 2013 Duchy Software Ltd. All rights reserved.
//

#import "StaffService.h"
#import "Staff.h"
#import "Project.h"

@implementation StaffService

- (id)init {
    self = [super init];
    if (self) {
        [self setupData];
    }
    return self;
}

- (void)setupData {
    
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"staffData" ofType:@"plist"];
    NSArray *rawDataArray = [NSArray arrayWithContentsOfFile:dataPath];
    NSMutableArray *staffMembers = [NSMutableArray array];
    for (NSDictionary *staffData in rawDataArray) {
        Staff *newStaff = [[Staff alloc] initWithStaffName:staffData[@"name"]];
        for (NSDictionary *projectData in staffData[@"projects"]) {
            Project *project = [[Project alloc] initWithName:projectData[@"name"] description:projectData[@"projectDescription"]];
            [newStaff addProject:project];
        }
        [staffMembers addObject:newStaff];
    }
    
    self.staff = staffMembers;
}

@end
