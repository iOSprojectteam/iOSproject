//
//  Store.m
//  iOS_project_ryan
//
//  Created by Xcode User on 2017-04-11.
//  Copyright © 2017 Ryan Falcon. All rights reserved.
//

#import "Store.h"

@implementation Store


@synthesize image, stickersAdded, labelsAdded, linksShared;


-(id)initWithData:(NSString *)i newStickers:(NSString *)s newLabels:(NSString *)nl
      linksShared:(NSString *)ls {
    if(self = [super init]) {
        [self setImage:i];
        [self setStickersAdded:s];
        [self setLabelsAdded:nl];
        [self setLinksShared:ls];
    }
    return self;
}
@end
