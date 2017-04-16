//
//  AppDelegate.h
//  iOS_project_ryan
//
//  Created by Ryan Galimova on 2017-03-12.
//  Copyright © 2017 Ryan Galimova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Store.h"
#import "Picture.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    NSString *databaseName;
    NSString *databasePath;
    
    NSMutableString *imageTaken;
    NSMutableArray *labelsArray;
    NSMutableArray *stickersArray;
    NSMutableArray *linksSharedArray;
    
    // contains objects of Label and Sticker classes
    NSMutableArray *addedLabels;
    NSMutableArray *addedStickers;
    // image taken from camera
    UIImage *originalImage;
    // History
    NSMutableArray *pictureHistory;
    Picture *selectedImg;
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *databaseName;
@property (strong, nonatomic) NSString *databasePath;
@property (strong, nonatomic) NSMutableString *imageTaken;
@property (strong, nonatomic) NSMutableArray *labelsArray;
@property (strong, nonatomic) NSMutableArray *stickersArray;
@property (strong, nonatomic) NSMutableArray *linksSharedArray;

@property (strong, nonatomic) NSMutableArray *addedLabels;
@property (strong, nonatomic) NSMutableArray *addedStickers;
@property (strong, nonatomic) UIImage *originalImage;
@property (strong, nonatomic) NSMutableArray *pictureHistory;
@property (strong, nonatomic) Picture *selectedImg;

-(void)readDataFromDatabase;
-(void)checkAndCreateDatabase;
-(BOOL)insertIntoDatabase:(Store *)person;
@end

