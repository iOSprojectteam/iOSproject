//
//  HistoryViewController.h
//  FinalProject
//
//  Created by Habibullah Ghazniwa on 2017-03-12.
//  Copyright © 2017 Habibullah Ghazniwa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Picture.h"
@interface HistoryViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource>{

    NSArray *sampleAr;
    AppDelegate *mainDelgate;
    Picture *selectedPic;
}
@property (nonatomic, strong) NSArray *sampleAr;
@property (nonatomic, strong) NSIndexPath *selectedItemIndexPath;
@property (nonatomic, strong) AppDelegate *mainDelgate;
@property (nonatomic, strong) Picture *selectedPic;
@end
