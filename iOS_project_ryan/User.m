//
//  User.m
//  FinalProject
//
//  Created by Bradley Zwarich on 2017-03-13.
//  Copyright © 2017 Bradley Zwarich. All rights reserved.
//

#import "User.h"

@implementation User
@synthesize name, favouriteFont, favouriteColour;
-(id)initWIthData:(NSString *)n theFont:(NSString *)f theColour:(NSString *)c
{
    
    if (self = [super init])
    {
        [self setFavouriteFont:f];
        [self setFavouriteColour:c];
        [self setName:n];
        
    }
    return self;
}
@end
