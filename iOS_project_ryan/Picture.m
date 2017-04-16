//
//  Picture.m
//  iOS_project_ryan
//
//  Created by Habibullah Ghazniwa on 2017-04-16.
//  Copyright © 2017 Ryan Falcon. All rights reserved.
//

#import "Picture.h"

@implementation Picture
@synthesize stkArray, lblArray, renderedImg, mainImg;

-(id)initWithData:(UIImage *)img theLabels:(NSMutableArray *)l theStickers:(NSMutableArray *)s theRenderedImg:(UIImage *)r{
    if (self = [super init]){
        [self setMainImg:img];
        [self setLblArray:l];
        [self setStkArray:s];
        [self setRenderedImg:r];
    }
    return self;
}


@end
