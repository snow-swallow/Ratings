//
//  XYZPlayerDetailsViewController.h
//  Ratings
//
//  Created by timelyxyz on 14-2-21.
//
//

#import <UIKit/UIKit.h>
#import "XYZPlayer.h"
#import "XYZGamePickerViewController.h"

@class XYZPlayerDetailsViewController;
@protocol XYZPlayerDetailsViewControllerDelegate <NSObject>
- (void)playerDetailsViewControllerDidCancel:(XYZPlayerDetailsViewController *)controller;
- (void)playerDetailsViewController:(XYZPlayerDetailsViewController *)controller didAddPlayer:(XYZPlayer *)player;
@end

@interface XYZPlayerDetailsViewController : UITableViewController<XYZGamePickerViewControllerDelegate>

@property (nonatomic,weak) id <XYZPlayerDetailsViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *gameLable;

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

-(IBAction)cancel:(id)sender;
-(IBAction)done :(id)sender;

@end
