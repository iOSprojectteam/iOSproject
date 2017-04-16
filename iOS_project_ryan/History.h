//
//  History.h
//  iOS_project_ryan
//
//  Created by Habibullah Ghazniwa on 2017-04-13.
//  Copyright © 2017 Habibullah Ghazniwa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface History : NSObject{
    NSMutableArray *photoes;
    NSMutableArray *selectedItems;
}
@property (nonatomic, strong) NSMutableArray *photoes;
@property (nonatomic, strong) NSMutableArray *selectedItems;

-(void)deleteSeletectedItems;
-(void)addPhotoes:(NSSet *)objects;
-(void)addSelectedItems:(NSSet *)objects;
@end
