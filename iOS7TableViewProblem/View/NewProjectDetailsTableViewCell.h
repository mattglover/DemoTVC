//
//  NewProjectDetailsTableViewCell.h
//  iOS7TableViewProblem
//
//  Created by Matt Glover on 26/09/2013.
//  Copyright (c) 2013 Duchy Software Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NewProjectDetailsTableViewCell;
@protocol NewProjectDetailsTableViewCellDelegate <NSObject>
@optional
- (void)newProjectCellDidAddProject:(NewProjectDetailsTableViewCell *)cell;
- (void)newProjectCellDidAddCancel:(NewProjectDetailsTableViewCell *)cell;
@end

@interface NewProjectDetailsTableViewCell : UITableViewCell

@property (nonatomic, weak) id<NewProjectDetailsTableViewCellDelegate>delegate;
@property (nonatomic, weak) IBOutlet UITextView *projectTextView;
@property (nonatomic, weak) IBOutlet UIButton *addProjectButton;
@property (nonatomic, weak) IBOutlet UIButton *cancelButton;

- (IBAction)addProjectPressed:(id)sender;
- (IBAction)cancelPressed:(id)sender;
@end
