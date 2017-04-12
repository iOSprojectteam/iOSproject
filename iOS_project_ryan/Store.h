//
//  Store.h
//  iOS_project_ryan
//
//  Created by Xcode User on 2017-04-11.
//  Copyright © 2017 Ryan Falcon. All rights reserved.
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
