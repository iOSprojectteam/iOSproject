//
//  Picture.m
//  iOS_project_ryan
//
//  Created by Ryan Galimova on 2017-03-12.
//  Copyright © 2017 Ryan Galimova. All rights reserved.
//
//  This class takes an input image and combines it with stickers and labels to produce an output picture

#import "PictureProcessor.h"

@implementation PictureProcessor

// This class is a singleton
+ (instancetype)sharedPictureProcessor {
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

#pragma mark Public methods

// Places stickers and labels on image and calls the callback (the protocol that the EditViewController implements)
- (void)placeStickers:(UIImage*)inputPicture stickers:(NSMutableArray*)stickerList labels:(NSMutableArray*)labelList{
    UIImage * outputPicture = [self processUsingCoreGraphics:inputPicture stickers:(NSMutableArray*)stickerList labels:(NSMutableArray*)labelList];
    
    if ([self.delegate respondsToSelector:
         @selector(didFinishedPlacingStickers:)]) {
        [self.delegate didFinishedPlacingStickers:outputPicture];
    }
}

// creates a sticker with a random size and position for the given input image
-(Sticker *)createStickerAtRandomPosition:(UIImage*)input name:(NSString *)stickerFileName {
    
    CGRect imageRect = {CGPointZero,input.size};
    NSInteger inputWidth = CGRectGetWidth(imageRect);
    NSInteger inputHeight = CGRectGetHeight(imageRect);
    
    // get the size and location of the sticker
    UIImage * sticker = [UIImage imageNamed:stickerFileName];
    
    CGFloat stickerImageAspectRatio = sticker.size.width / sticker.size.height;
    
    NSInteger maxW = sticker.size.width ;
    NSInteger maxH = sticker.size.height;
    
    // make sure the sticker size is so it fits in the picture
    if (inputWidth < maxW) {
        maxW = inputWidth;
        maxH = maxW / stickerImageAspectRatio;
        if (inputHeight < maxH){
            maxH = inputHeight;
            maxW = maxH * stickerImageAspectRatio;
        }
    } else if (inputHeight < maxH) {
        maxH = inputHeight;
        maxW = maxH * stickerImageAspectRatio;
    }
    
    
    // get a random scale
    NSInteger minW = 5;
    NSInteger w = arc4random_uniform(maxW - minW) + minW;
    NSInteger h = w / stickerImageAspectRatio;
    
    // defina a range of possible locations so that it fits
    int maxX = floor(inputWidth - w);
    int maxY = floor(inputHeight - h);
    
    // get a random location
    NSInteger x = arc4random_uniform(maxX);
    NSInteger y = arc4random_uniform(maxY);
    
    Sticker *newSticker = [[Sticker alloc] initWithData:x Y:y theWidth:w theHeight:h file:stickerFileName];
    return newSticker;
}

#pragma mark Private methods
// Places a single sticker on the given image
- (UIImage*) placeStickerOnImage:(UIImage*)input sticker:(Sticker*)s{
    
    CGRect imageRect = {CGPointZero,input.size};
    NSInteger inputHeight = CGRectGetHeight(imageRect);
    
    // get the size and location of the sticker
    UIImage * stickerImage = [UIImage imageNamed:s.fileName];

    CGSize stickerSize = CGSizeMake((int)s.width, (int)s.height);
    CGPoint stickerOrigin = CGPointMake((double)s.x, (double)s.y);
    CGRect stickerRect = {stickerOrigin, stickerSize};
    
    // draw the image into the context
    UIGraphicsBeginImageContext(input.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGAffineTransform flip = CGAffineTransformMakeScale(1.0, -1.0);
    CGAffineTransform flipThenShift = CGAffineTransformTranslate(flip,0,-inputHeight);
    CGContextConcatCTM(context, flipThenShift);
    
    CGContextDrawImage(context, imageRect, [input CGImage]);
    
    CGContextSetBlendMode(context, kCGBlendModeSourceAtop);
    CGContextSetAlpha(context,1);
    CGRect transformedStickerRect = CGRectApplyAffineTransform(stickerRect, flipThenShift);
    CGContextDrawImage(context, transformedStickerRect, [stickerImage CGImage]);
    
    // retrieve processed image
    UIImage * imageWithSticker = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageWithSticker;
}

// places single label in the given image
- (UIImage*) placeLabelOnImage:(UIImage*)input label:(Label*)l{
    
    UIGraphicsBeginImageContext(input.size);
    [input drawInRect:CGRectMake(0,0,input.size.width,input.size.height)];
    CGSize imageSize = input.size;
    CGPoint point = CGPointMake(0, 0);
    
    CGFloat paddingX = 20.f;
    CGFloat paddingY = 20.f;

    UIFont *font = [UIFont boldSystemFontOfSize:12];
    UIColor *textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    //[[UIColor whiteColor] set];
    NSDictionary *att = @{NSForegroundColorAttributeName: textColor, NSFontAttributeName:font};
    CGSize textSize = [l.text sizeWithAttributes:att];

    CGRect rect = CGRectMake(imageSize.width - textSize.width - paddingX, imageSize.height - textSize.height - paddingY, textSize.width, textSize.height);
    //CGRect rect = CGRectMake(point.x, point.y, input.size.width, input.size.height);
    
    [l.text drawInRect:rect withAttributes:att];
    
    UIImage *imageWithLabel = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageWithLabel;
    
}

// Feature: Core Graphics usage
// iterates through all stickers and lables to be added and adds them one by one
- (UIImage *)processUsingCoreGraphics:(UIImage*)input stickers:(NSMutableArray*)stickerList labels:(NSMutableArray*)labelList{
    
    // place all stickers one by one
    Sticker * s;
    UIImage* currentImage = input;
    for (s in stickerList) {
        currentImage = [self placeStickerOnImage:currentImage sticker:s];
    }
    
    Label * l;
    for (l in labelList) {
        currentImage = [self placeLabelOnImage:currentImage label:l];
    }
    
    return currentImage;
}




@end
