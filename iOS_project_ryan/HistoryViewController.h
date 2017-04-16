//
//  HistoryViewController.h
//  FinalProject
//
//  Created by Habibullah Ghazniwa on 2017-03-12.
//  Copyright © 2017 Habibullah Ghazniwa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource>{

    NSArray *sampleAr;

}
@property (nonatomic, strong) NSArray *sampleAr;
@property (nonatomic, strong) NSIndexPath *selectedItemIndexPath;
@end
