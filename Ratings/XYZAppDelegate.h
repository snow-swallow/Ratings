//
//  XYZAppDelegate.h
//  Ratings
//
//  Created by timelyxyz on 14-2-19.
//
//

#import <UIKit/UIKit.h>
#import "CoreData/CoreData.h"

@interface XYZAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void) saveContext;
- (NSURL *) applicationDocumentsDirectory;

@end
