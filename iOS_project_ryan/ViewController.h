//
//  ViewController.h
//  iOS_project_ryan
//
//  Created by Ryan Galimova on 2017-03-12.
//  Copyright © 2017 Ryan Galimova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>{

UIButton *btnHistory;
UIButton *btnShare;
AppDelegate *mainDelegate;
}

@property (nonatomic, strong) UIButton *btnHistory;
@property (nonatomic, strong) UIButton *btnShare;
@property (nonatomic, strong) AppDelegate *mainDelegate;

@end

