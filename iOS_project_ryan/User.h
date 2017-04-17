//
//  User.h
//  FinalProject
//
//  Created by Bradley Zwarich on 2017-03-13.
//  Copyright © 2017 Bradley Zwarich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface User : NSObject
{
    // Name if for the user name to user later
    NSString *name;
    // Font is for the user's preferred font to use later
    NSString *favouriteSize;
    // Colour is for user's preferred colour to use later
    NSString *favouriteColour;
    
}

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *favouriteSize;
@property (nonatomic, strong) NSString *favouriteColour;

-(id)initWithData:(NSString *)n theFont:(NSString *)f theColour:(NSString *)c;


@end
