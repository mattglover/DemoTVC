//
//  Staff.h
//  iOS7TableViewProblem
//
//  Created by Matt Glover on 25/09/2013.
//  Copyright (c) 2013 Duchy Software Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Project;
@interface Staff : NSObject

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSArray *projects;

- (instancetype)initWithStaffName:(NSString *)name;
- (void)addProject:(Project *)project;

@end
