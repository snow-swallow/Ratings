//
//  XYZAppDelegate.m
//  Ratings
//
//  Created by timelyxyz on 14-2-19.
//
//

#import "XYZAppDelegate.h"
#import "XYZPlayer.h"
#import "XYZPlayersViewController.h"
#import "CoreData/CoreData.h"



@implementation XYZAppDelegate
{
    NSMutableArray *_players;
}

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    _players = [NSMutableArray arrayWithCapacity: 20];
    
    XYZPlayer *player = [[XYZPlayer alloc] init];
    player.name = @"xyz";
    player.game = @"Tic-Tac";
    player.rating = 4;
    [_players addObject:player];
    
    player = [[XYZPlayer alloc] init];
    player.name = @"lala";
    player.game = @"nice shot";
    player.rating = 5;
    [_players addObject: player];
    
    player = [[XYZPlayer alloc] init];
    player.name = @"nini";
    player.game = @"-----^.^-----";
    player.rating = 2;
    [_players addObject: player];
    
    UITabBarController *tabBarController = (UITabBarController *) self.window.rootViewController;
    UINavigationController *navigationController = [tabBarController viewControllers][0];
    XYZPlayersViewController *playersViewController = [navigationController viewControllers][0];
    playersViewController.players = _players;
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void) saveContext
{
    NSError *error = nil;
    
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if(managedObjectContext != nil){
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            NSLog(@"Unresolved error%@, %@", error, [error userInfo]);
        }
    }
}
- (NSManagedObjectContext *) managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if(coordinator != nil){
        NSLog(@"coordinator is not null-----");
        _managedObjectContext = [[NSManagedObjectContext alloc]init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }else{
        NSLog(@"coordinator is null-----");
    }
    return _managedObjectContext;
}
- (NSManagedObjectModel *) managedObjectModel
{
    if(_managedObjectModel != nil){
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Ratings" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc]initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}
- (NSPersistentStoreCoordinator *) persistentStoreCoordinator
{
    if(_persistentStoreCoordinator != nil){
        return _persistentStoreCoordinator;
    }
    NSURL *storeUrl = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Ratings.sqlite"];
    NSError *error = nil;
    NSLog(@"storeUrl: %@",[self applicationDocumentsDirectory]);
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:[self managedObjectModel]];
    if(![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]){
        NSLog(@"Unresolved error %@%@", error, [error userInfo]);
        abort();
    }
    return _persistentStoreCoordinator;
}
- (NSURL *) applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]lastObject];
}
@end
