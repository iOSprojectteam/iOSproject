//
//  History.m
//  iOS_project_ryan
//
//  Created by Habibullah Ghazniwa on 2017-04-13.
//  Copyright © 2017 Habibullah Ghazniwa. All rights reserved.
//

#import "History.h"

@implementation History
@synthesize photoes, selectedItems;

-(void)deleteSeletectedItems{

    for (int i = 0; i < selectedItems.count; i++) {
        [photoes removeObject:selectedItems.firstObject];
    }
}

-(void)addSelectedItems:(NSSet *)objects{
    [selectedItems addObject:objects];
}

-(void)addPhotoes:(NSSet *)objects{
    [photoes addObject:objects];
}


@end
