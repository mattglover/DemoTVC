//
//  NewProjectDetailsTableViewCell.m
//  iOS7TableViewProblem
//
//  Created by Matt Glover on 26/09/2013.
//  Copyright (c) 2013 Duchy Software Ltd. All rights reserved.
//

#import "NewProjectDetailsTableViewCell.h"

@interface NewProjectDetailsTableViewCell () <UITextViewDelegate>

@end

@implementation NewProjectDetailsTableViewCell

- (UITableViewCellSelectionStyle)selectionStyle {
    return UITableViewCellSelectionStyleNone;
}

- (IBAction)addProjectPressed:(id)sender {
    if ([self.delegate respondsToSelector:@selector(newProjectCellDidAddProject:)]) {
        [self.delegate newProjectCellDidAddProject:self];
    }
}

- (IBAction)cancelPressed:(id)sender {
    
    [self.projectTextView resignFirstResponder];
    
    if ([self.delegate respondsToSelector:@selector(newProjectCellDidAddCancel:)]) {
        [self.delegate newProjectCellDidAddCancel:self];
    }
}

#pragma mark - UITextView Delegate
- (BOOL)textViewShouldEndEditing:(UITextView *)textView; {
    [textView resignFirstResponder];
    return YES;
}

@end
