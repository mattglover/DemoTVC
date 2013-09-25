//
//  Staff.m
//  iOS7TableViewProblem
//
//  Created by Matt Glover on 25/09/2013.
//  Copyright (c) 2013 Duchy Software Ltd. All rights reserved.
//

#import "Staff.h"

@interface Staff ()
@property (nonatomic, strong) NSMutableArray *mutableProjects;
@end

@implementation Staff

- (instancetype)initWithStaffName:(NSString *)name {
    
    self = [super init];
    if (self) {
        _name = name;
        _mutableProjects = [NSMutableArray array];
    }
    return self;
}

- (void)addProject:(Project *)project {
    [_mutableProjects addObject:project];
}

- (NSArray *)projects {
    return _mutableProjects;
}

@end
