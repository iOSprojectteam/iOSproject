//
//  AppDelegate.h
//  iOS_project_ryan
//
//  Created by Galimova Galina on 2017-03-12.
//  Copyright © 2017 Ryan Falcon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Store.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    NSString *databaseName;
    NSString *databasePath;
    
    NSMutableString *imageTaken;
    NSMutableArray *labelsArray;
    NSMutableArray *stickersArray;
    NSMutableArray *linksSharedArray;
    
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *databaseName;
@property (strong, nonatomic) NSString *databasePath;
@property (strong, nonatomic) NSMutableString *imageTaken;
@property (strong, nonatomic) NSMutableArray *labelsArray;
@property (strong, nonatomic) NSMutableArray *stickersArray;
@property (strong, nonatomic) NSMutableArray *linksSharedArray;

-(void)readDataFromDatabase;
-(void)checkAndCreateDatabase;
-(BOOL)insertIntoDatabase:(Store *)person;
@end

