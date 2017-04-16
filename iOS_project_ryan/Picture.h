//
//  Picture.h
//  iOS_project_ryan
//
//  Created by Habibullah Ghazniwa on 2017-04-16.
//  Copyright © 2017 Habibullah Ghazniwa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Picture : NSObject{
    
    // original image from camera
    UIImage *mainImg;
    // array of labels to apply
    NSMutableArray *lblArray;
    // array of stickers to apply
    NSMutableArray *stkArray;
    // rendered image with all stickers and labels applied
    UIImage *renderedImg;
}

@property (nonatomic, strong)  UIImage *mainImg;
@property (nonatomic, strong)  NSMutableArray *lblArray;
@property (nonatomic, strong)  NSMutableArray *stkArray;
@property (nonatomic, strong)  UIImage *renderedImg;

-(id)initWithData:(UIImage *)img theLabels:(NSMutableArray *)l theStickers:(NSMutableArray *)s theRenderedImg:(UIImage *)r;
@end
