//
//  Store.h
//  iOS_project_ryan
//
//  Created by Charles Javelona on 2017-04-11.
//  Copyright © 2017 Charles Javelona. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store : NSObject {

    NSString *image;
    
    /*Will be a long string, separated by comma limited*/
    NSString *labelsAdded;
    NSString *stickersAdded;
    NSString *linksShared;
}

@property (nonatomic, strong) NSString *image;

/*Will be a long string, separated by comma limited*/
@property (nonatomic, strong) NSString *labelsAdded;
@property (nonatomic, strong) NSString *stickersAdded;
@property (nonatomic, strong) NSString *linksShared;

@end
