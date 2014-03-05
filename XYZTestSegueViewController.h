//
//  XYZTestSegueViewController.h
//  Ratings
//
//  Created by timelyxyz on 14-2-21.
//
//

#import <UIKit/UIKit.h>

@class XYZTestSegueViewController;
@protocol BackDelegate  <NSObject>

-(void)back:(XYZTestSegueViewController *)controller;

@end


@interface XYZTestSegueViewController : UITableViewController

@property(nonatomic,weak) id<BackDelegate> delegate;

-(IBAction)back:(id)sender;

@end
