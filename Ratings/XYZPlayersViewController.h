//
//  XYZPlayersViewController.h
//  Ratings
//
//  Created by timelyxyz on 14-2-20.
//
//

#import <UIKit/UIKit.h>
#import "XYZPlayerDetailsViewController.h"
#import "XYZTestSegueViewController.h"
#import "CoreData/CoreData.h"
#import "Player.h"

@interface XYZPlayersViewController : UITableViewController <XYZPlayerDetailsViewControllerDelegate, BackDelegate>

@property (nonatomic,strong) NSMutableArray *players;
@property (nonatomic, strong) NSManagedObjectContext *context;

@end
