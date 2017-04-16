//
//  CameraViewController.h
//  FinalProject
//
//  Created by Xcode User on 2017-03-29.
//  Copyright © 2017 Bradley Zwarich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface CameraViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    //The image view is meant for holding the picture taken
    IBOutlet UIImageView *imageView;
    AppDelegate *mainDelegate;

}
@property(nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) AppDelegate *mainDelegate;
@end
