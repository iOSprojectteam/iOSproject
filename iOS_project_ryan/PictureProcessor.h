//
//  Picture.h
//  iOS_project_ryan
//
//  Created by Ryan Galimova on 2017-03-12.
//  Copyright © 2017 Ryan Galimova. All rights reserved.

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#include <stdlib.h>
#import "Sticker.h"
#import "Label.h"

// Feature: protocol
@protocol PictureProcessorDelegate <NSObject>

- (void)didFinishedPlacingStickers:(UIImage*)outputPicture;

@end

@interface PictureProcessor : NSObject
@property (weak, nonatomic) id<PictureProcessorDelegate> delegate;

// singleton
+ (instancetype)sharedPictureProcessor;

// public methods
- (void)placeStickers:(UIImage*)inputPicture stickers:(NSMutableArray*)stickerList labels:(NSMutableArray*)labelList;
-(Sticker *)createStickerAtRandomPosition:(UIImage*)input name:(NSString *)stickerFileName;
@end
