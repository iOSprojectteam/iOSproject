//
//  Label.m
//  iOS_project_ryan
//
//  Created by Xcode User on 2017-04-12.
//  Copyright © 2017 Ryan Falcon. All rights reserved.
//

#import "Label.h"

@implementation Label
@synthesize font, fontSize, fontDecoration, color, positioning, text;

-(id)initWIthData:(NSString *)fontt theColor:(NSString *)colorr theText:(NSString *)textt theSize:(NSNumber *)size theDecoration: (NSString *)decoration thePositioning:(NSString *)positioningg
{
    if (self = [super init])
    {
        [self setFont:fontt];
        [self setColor:colorr];
        [self setText:textt];
        [self setFontSize:size];
        [self setFontDecoration:decoration];
        [self setPositioning:positioningg];
        
    }
    return self;
}


@end
