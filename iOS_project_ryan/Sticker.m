//
//  Sticker.m
//  iOS_project_ryan
//
//  Created by Galimova Galina on 2017-03-12.
//  Copyright © 2017 Ryan Falcon. All rights reserved.
//

#import "Sticker.h"

@implementation Sticker
@synthesize x, y, width, height, rotation, fileName;

-(void) move: (NSInteger)offsetX y: (NSInteger)offsetY
{
    x = x + offsetX;
    y = y + offsetY;
}

-(id)initWithData: (NSInteger)posX Y:(NSInteger)posY theWidth:(NSInteger)w theHeight:(NSInteger)h file:(NSString*)f
{
    if(self = [super init])
    {
        [self setX:posX];
        [self setY:posY];
        [self setWidth:w];
        [self setHeight:h];
        [self setFileName:f];
    }
    return self;
}

@end
