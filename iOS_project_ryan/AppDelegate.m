//
//  AppDelegate.m
//  iOS_project_ryan
//
//  Created by Galimova Galina on 2017-03-12.
//  Copyright © 2017 Ryan Falcon. All rights reserved.
//

#import "AppDelegate.h"
#import <sqlite3.h>


@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize databaseName, databasePath, imageTaken,
labelsArray, stickersArray, linksSharedArray, addedLabels, addedStickers, originalImage, pictureHistory, selectedImg;

#pragma mark Database Methods

-(void)checkAndCreateDatabase {
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    success = [fileManager fileExistsAtPath:self.databasePath];
    
    if(success) return;
    
    NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:self.databaseName];
    
    [fileManager copyItemAtPath:databasePathFromApp toPath:self.databasePath error:nil];
    
    return;
}

-(BOOL)insertIntoDatabase:(User *)person {
    /*
    
    sqlite3 *database;
    BOOL returnCode = YES;
    
    if(sqlite3_open([self.databasePath UTF8String], &database) == SQLITE_OK)
    {
        char *sqlStatement = "insert into person values(NULL, ?, ?, ?)";
        sqlite3_stmt *compiledStatement;
        
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
            sqlite3_bind_text(compiledStatement, 1, [person.name UTF8String], -1,SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 2, [person.favouriteFont UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 3, [person.favouriteColour UTF8String], -1, SQLITE_TRANSIENT);
            
        }
        
        if(sqlite3_step(compiledStatement) != SQLITE_DONE)
        {
            NSLog(@"Error: %s", sqlite3_errmsg(database));
            returnCode = NO;
        }
        else
        {
            NSLog(@"Insert into row id = %lld", sqlite3_last_insert_rowid(database));
        }
        sqlite3_finalize(compiledStatement);
    }
    
    sqlite3_close(database);
    return returnCode;
    */
     return YES;

    
}

-(void)readDataFromDatabase {
    /*
    [self.people removeAllObjects];
    
    sqlite3 *database;
    
    if(sqlite3_open([self.databasePath UTF8String], &database) == SQLITE_OK) {
        char *sqlStatement = "select * from person";
        sqlite3_stmt *compiledStatement;
        
        int t = (sqlite3_prepare_v2(database,sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK);
        NSLog(@"%d", t);
        
        if(sqlite3_prepare_v2(database,sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
            while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                char *a = sqlite3_column_text(compiledStatement, 1);
                NSString *avatar= [NSString stringWithUTF8String:(char *)a];
                
                char *n = sqlite3_column_text(compiledStatement, 2);
                NSString *name = [NSString stringWithUTF8String:(char *)n];
                
                char *p = sqlite3_column_text(compiledStatement, 3);
                NSString *phone = [NSString stringWithUTF8String:(char *)p];
                
                char *e = sqlite3_column_text(compiledStatement, 4);
                NSString *email = [NSString stringWithUTF8String:(char *)e];
                
                char *b = sqlite3_column_text(compiledStatement, 5);
                NSString  *birthday = [NSString stringWithUTF8String:(char *)b];
                
                char *g = sqlite3_column_text(compiledStatement, 6);
                NSString  *gender = [NSString stringWithUTF8String:(char *)g];
                
                char *ag = sqlite3_column_text(compiledStatement, 7);
                NSString  *age = [NSString stringWithUTF8String:(char *)ag];
                
                Data *data = [[Data alloc] initWithData:avatar newName:name newPhone:phone
                                               newEmail:email newBirthday:birthday newGender:gender
                                                 newAge:age
                              ];
                [self.people addObject:data];
            }
        }
        sqlite3_finalize(compiledStatement);
        
    }
    sqlite3_close(database);
    */
}


#pragma mark App Methods
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.databaseName = @"database.db";
    self.labelsArray = [[NSMutableArray alloc] init];
    self.stickersArray = [[NSMutableArray alloc] init];
    self.linksSharedArray = [[NSMutableArray alloc] init];
    
    //Returns an array of documentation of directories
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDir = [documentPaths objectAtIndex:0];
    self.databasePath = [documentsDir stringByAppendingPathComponent:self.databaseName];
    [self checkAndCreateDatabase];
    [self readDataFromDatabase];
    [self imageTaken];

    self.pictureHistory = [[NSMutableArray alloc] init];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
