//
//  StaffNameTableViewCell.h
//  iOS7TableViewProblem
//
//  Created by Matt Glover on 25/09/2013.
//  Copyright (c) 2013 Duchy Software Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StaffNameTableViewCell;
@protocol StaffNameTableViewCellDelegate <NSObject>

@optional
- (void)staffNameTableCellDidSelectCancel:(StaffNameTableViewCell *)cell;
- (void)staffNameTableCellDidSelectCall:(StaffNameTableViewCell *)cell;
- (void)staffNameTableCellDidSelectPage:(StaffNameTableViewCell *)cell;

@end

@interface StaffNameTableViewCell : UITableViewCell

@property (nonatomic, assign) id<StaffNameTableViewCellDelegate> delegate;

@property (nonatomic, weak) IBOutlet UILabel *staffNameLabel;
@property (nonatomic, weak) IBOutlet UIButton *callButton;
@property (nonatomic, weak) IBOutlet UIButton *pageButton;
@property (nonatomic, weak) IBOutlet UIButton *cancelButton;

- (IBAction)callButtonPressed:(id)sender;
- (IBAction)pageButtonPressed:(id)sender;
- (IBAction)cancelButtonPressed:(id)sender;

@end
