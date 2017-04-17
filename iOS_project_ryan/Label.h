//
//  Label.h
//  iOS_project_ryan
//
//  Created by Bradley Zwarich on 2017-04-12.
//  Copyright © 2017 Bradley Zwarich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Label : NSObject {
    NSString *font;
    NSUInteger fontSize;
    UIColor *color;
    NSInteger x;
    NSInteger y;
    NSString *text;
    NSString *fontDecoration;
    
}

@property(nonatomic, strong)NSString *font;
@property(nonatomic)NSUInteger fontSize;
@property(nonatomic, strong)UIColor *color;
@property(nonatomic)NSInteger x;
@property(nonatomic)NSInteger y;
@property(nonatomic, strong)NSString *text;
@property(nonatomic, strong)NSString *fontDecoration;

-(id)initWithData:(NSString *)f theColor:(UIColor *)c theText:(NSString *)t theSize:(NSUInteger)s theDecoration: (NSString *)d X:(NSInteger)posX Y:(NSInteger)posY;
-(id)initWithText:(NSString *)t;

@end
