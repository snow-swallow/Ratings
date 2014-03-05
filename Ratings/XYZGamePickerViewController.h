//
//  XYZGamePickerViewController.h
//  Ratings
//
//  Created by timelyxyz on 14-2-21.
//
//

#import <UIKit/UIKit.h>

@class XYZGamePickerViewController;
@protocol XYZGamePickerViewControllerDelegate <NSObject>

-(void)gamePickerViewController:(XYZGamePickerViewController *)controller didSelectGame: (NSString *)game;

@end

@interface XYZGamePickerViewController : UITableViewController

@property (nonatomic, weak) id <XYZGamePickerViewControllerDelegate> delegate;
@property (nonatomic, weak) NSString *game;
@end
