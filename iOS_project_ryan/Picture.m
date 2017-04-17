//
//  Picture.m
//  iOS_project_ryan
//
//  Created by Habibullah Ghazniwa on 2017-04-16.
//  Copyright © 2017 Habibullah Ghazniwa. All rights reserved.
//
// Contains an original image from the camera and arrays of stickers and labels to be applied to that image. The objects of this class are stored then in the pictureHistory array to be accessed at History page.

#import "Picture.h"

@implementation Picture
@synthesize stkArray, lblArray, renderedImg, mainImg;
//constructor
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
