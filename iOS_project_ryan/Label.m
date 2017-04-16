//
//  Label.m
//  iOS_project_ryan
//
//  Created by Bradley Zwarich on 2017-04-12.
//  Copyright © 2017 Bradley Zwarich. All rights reserved.
//

#import "Label.h"

@implementation Label
@synthesize font, fontSize, fontDecoration, color, x, y, text;

-(id)initWithData:(NSString *)f theColor:(NSString *)c theText:(NSString *)t theSize:(NSNumber *)s theDecoration: (NSString *)d X:(NSInteger)posX Y:(NSInteger)posY
{
    if (self = [super init])
    {
        [self setFont:f];
        [self setColor:c];
        [self setText:t];
        [self setFontSize:s];
        [self setFontDecoration:d];
        [self setX:posX];
        [self setY:posY];
        
    }
    return self;
}

-(id)initWithText:(NSString *)t
{
    if (self = [super init])
    {
        [self setText:t];
    }
    return self;
}


@end
