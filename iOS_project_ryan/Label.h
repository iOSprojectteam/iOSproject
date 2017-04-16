//
//  Label.h
//  iOS_project_ryan
//
//  Created by Xcode User on 2017-04-12.
//  Copyright © 2017 Ryan Falcon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Label : NSObject {
    NSString *font;
    NSNumber *fontSize;
    NSString *color;
    NSInteger x;
    NSInteger y;
    NSString *text;
    NSString *fontDecoration;
    
}

@property(nonatomic, strong)NSString *font;
@property(nonatomic, strong)NSNumber *fontSize;
@property(nonatomic, strong)NSString *color;
@property(nonatomic)NSInteger x;
@property(nonatomic)NSInteger y;
@property(nonatomic, strong)NSString *text;
@property(nonatomic, strong)NSString *fontDecoration;

-(id)initWithData:(NSString *)f theColor:(NSString *)c theText:(NSString *)t theSize:(NSNumber *)s theDecoration: (NSString *)d X:(NSInteger)posX Y:(NSInteger)posY;
-(id)initWithText:(NSString *)t;

@end
