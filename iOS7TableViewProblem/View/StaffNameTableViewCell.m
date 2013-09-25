//
//  StaffNameTableViewCell.m
//  iOS7TableViewProblem
//
//  Created by Matt Glover on 25/09/2013.
//  Copyright (c) 2013 Duchy Software Ltd. All rights reserved.
//

#import "StaffNameTableViewCell.h"

@implementation StaffNameTableViewCell

- (UITableViewCellSelectionStyle)selectionStyle {
    return UITableViewCellSelectionStyleNone;
}

- (IBAction)callButtonPressed:(id)sender {
    if ([self.delegate respondsToSelector:@selector(staffNameTableCellDidSelectCancel:)]) {
        [self.delegate staffNameTableCellDidSelectCall:self];
    }
}

- (IBAction)pageButtonPressed:(id)sender {
    if ([self.delegate respondsToSelector:@selector(staffNameTableCellDidSelectPage:)]) {
        [self.delegate staffNameTableCellDidSelectPage:self];
    }
}

- (IBAction)cancelButtonPressed:(id)sender {
    if ([self.delegate respondsToSelector:@selector(staffNameTableCellDidSelectCall:)]) {
        [self.delegate staffNameTableCellDidSelectCancel:self];
    }
}

@end
