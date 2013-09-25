//
//  Project.h
//  iOS7TableViewProblem
//
//  Created by Matt Glover on 25/09/2013.
//  Copyright (c) 2013 Duchy Software Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Project : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *projectDescription;

- (instancetype)initWithName:(NSString *)name description:(NSString *)desccription;

@end
