//
//  Player.h
//  Ratings
//
//  Created by timelyxyz on 14-2-25.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Player : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * game;
@property (nonatomic, retain) NSNumber * rating;

@end
