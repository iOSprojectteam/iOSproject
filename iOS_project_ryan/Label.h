//
//  Label.h
//  iOS_project_ryan
//
//  Created by Xcode User on 2017-04-12.
//  Copyright © 2017 Ryan Falcon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Label : NSObject
{
    NSString *font;
    NSNumber *fontSize;
    NSString *color;
    NSString *positioning;
    NSString *text;
    NSString *fontDecoration;
    
}

@property(nonatomic, strong)NSString *font;
@property(nonatomic, strong)NSNumber *fontSize;
@property(nonatomic, strong)NSString *color;
@property(nonatomic, strong)NSString *positioning;
@property(nonatomic, strong)NSString *text;
@property(nonatomic, strong)NSString *fontDecoration;
@end
