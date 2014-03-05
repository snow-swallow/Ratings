//
//  XYZPlayersViewController.m
//  Ratings
//
//  Created by timelyxyz on 14-2-20.
//
//

#import "CoreData/CoreData.h"
#import "XYZPlayersViewController.h"
#import "XYZPlayer.h"
#import "XYZPlayerCell.h"
#import "XYZTestSegueViewController.h"
#import "Player.h"
#import "XYZAppDelegate.h"


@interface XYZPlayersViewController ()

@end

@implementation XYZPlayersViewController

@synthesize context;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self savePlayerName:@"timelyxyz" savePlayerGame:@"Chess" rating:[NSNumber numberWithInt:100]];
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.players count];
}

-(UIImage *)imageForRating:(int)rating
{
    NSString *imageName = @"";
    switch (rating) {
        case 1:
            imageName = @"1StarSmall";
            break;
        case 2:
            imageName = @"2StarsSmall";
            break;
        case 3:
            imageName = @"3StarsSmall";
            break;
        case 4:
            imageName = @"4StarsSmall";
            break;
        case 5:
            imageName = @"5StarsSmall";
            break;
    }
    return [UIImage imageNamed:imageName];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    以下是用tag的形式来赋值
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayerCell"];
//    XYZPlayer *player = (self.players)[indexPath.row];
//    
//    UILabel *nameLabel =(UILabel *)[cell viewWithTag:100];
//    nameLabel.text = player.name;
//    
//    UILabel *gameLabel =(UILabel *)[cell viewWithTag:101];
//    gameLabel.text = player.game;
//    
//    UIImageView *ratingImageView = (UIImageView *)[cell viewWithTag:102];
//    ratingImageView.image = [self imageForRating:player.rating];
    
    //以下是用cell的形式来赋值
    XYZPlayerCell *xyzCell = (XYZPlayerCell *)[tableView dequeueReusableCellWithIdentifier:@"PlayerCell"];
    XYZPlayer *xyzPlayer = (self.players)[indexPath.row];
    xyzCell.nameLabel.text = xyzPlayer.name;
    xyzCell.gameLabel.text = xyzPlayer.game;
    xyzCell.ratingImageView.image = [self imageForRating:xyzPlayer.rating];
    
//    以下是cell默认的两个属性值
//    cell.textLabel.text = player.name;
//    cell.detailTextLabel.text = player.game;
    
    return xyzCell;
}

-(void)playerDetailsViewControllerDidCancel:(XYZPlayerDetailsViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)playerDetailsViewController:(XYZPlayerDetailsViewController *)controller
                      didAddPlayer:(XYZPlayer *)player
{
    [self.players addObject:player];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([self.players count] - 1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)back:(XYZTestSegueViewController *)controller{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - Navigation
-(void)prepareForSegue:(UIStoryboardSegue *)segue
                sender:(id)sender
{
    if([segue.identifier isEqualToString:@"AddPlayer"]){
        UINavigationController *navController = segue.destinationViewController;
        XYZPlayerDetailsViewController *playerDetailsViewController = [navController viewControllers][0];
        playerDetailsViewController.delegate = self;
    }else if ([segue.identifier isEqualToString:@"CellTestSegue"]){
        UINavigationController *navController = segue.destinationViewController;
        XYZTestSegueViewController *segueController = [navController viewControllers][0];
        segueController.delegate = self;
    }
}
-(void) savePlayerName:(NSString *)name
        savePlayerGame:(NSString *)game
                rating:(NSNumber *)rating
{
    XYZAppDelegate *delegate = (XYZAppDelegate *)[[UIApplication sharedApplication]delegate];
    self.context = delegate.managedObjectContext;
    
    Player *player = [NSEntityDescription insertNewObjectForEntityForName:@"Player"
                                                   inManagedObjectContext:context];
    player.name = name;
    player.game = game;
    player.rating = rating;
    
    NSError *error = nil;
    if(![context save:&error]){
        NSLog(@"%@", [error localizedDescription]);
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Player"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSArray *fetchObjects = [context executeFetchRequest:fetchRequest error:&error];
    for(NSManagedObject *info in fetchObjects){
        NSLog(@"name: %@",[info valueForKey:@"name"]);
        NSLog(@"game: %@", [info valueForKey:@"game"]);
        NSLog(@"rating: %@", [info valueForKey:@"rating"]);
    }
}

@end
