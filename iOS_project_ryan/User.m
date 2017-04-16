//
//  User.m
//  FinalProject
//
//  Created by Bradley Zwarich on 2017-03-13.
//  Copyright © 2017 Bradley Zwarich. All rights reserved.
//
// This class represents user settings

#import "User.h"

@implementation User
@synthesize name, favouriteSize, favouriteColour;
-(id)initWIthData:(NSString *)n theSize:(NSString *)f theColour:(NSString *)c
{
    
    if (self = [super init])
    {
        [self setFavouriteSize:f];
        [self setFavouriteColour:c];
        [self setName:n];
        
    }
    return self;
}
@end
