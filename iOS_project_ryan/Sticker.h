//
//  Sticker.h
//  iOS_project_ryan
//
//  Created by Galimova Galina on 2017-03-12.
//  Copyright © 2017 Ryan Falcon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sticker : NSObject
{
    NSInteger x;
    NSInteger y;
    NSInteger width;
    NSInteger height;
    NSInteger rotation;
    NSString *fileName;
}

@property (nonatomic) NSInteger x;
@property (nonatomic) NSInteger y;
@property (nonatomic) NSInteger width;
@property (nonatomic) NSInteger height;
@property (nonatomic) NSInteger rotation;
@property (nonatomic, strong) NSString *fileName;

-(id)initWithData: (NSInteger )posX Y:(NSInteger)posY theWidth:(NSInteger)w theHeight:(NSInteger)h file:(NSString*)f;

@end
