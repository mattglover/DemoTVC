//
//  Project.m
//  iOS7TableViewProblem
//
//  Created by Matt Glover on 25/09/2013.
//  Copyright (c) 2013 Duchy Software Ltd. All rights reserved.
//

#import "Project.h"

@implementation Project

- (instancetype)initWithName:(NSString *)name description:(NSString *)desccription {
    self = [super init];
    if (self) {
        _name = name;
        _projectDescription = desccription;
    }
    return self;
}

@end
