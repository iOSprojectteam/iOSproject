//
//  ViewController.h
//  FinalProject
//
//  Created by Bradley Zwarich on 2017-03-13.
//  Copyright © 2017 Bradley Zwarich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
@interface UserViewController : UIViewController<UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    // holds the avatar so that the user can be greeted with their ideal picture
    IBOutlet UIImageView *avatar;
    // holds the name to use in the user class
    IBOutlet UITextField *name;
    // holds the font to use for label class
    IBOutlet UITextField *favouriteFont;
    // holds the color to use for the label class
    IBOutlet UITextField *favouriteColour;
    // holds the avatar's picture
    IBOutlet UIImageView *imageView;
    
    
}
@property(nonatomic, strong)IBOutlet UIImageView *avatar;
@property(nonatomic, strong)IBOutlet UITextField *name;
@property(nonatomic, strong)IBOutlet UITextField *favouriteFont;
@property(nonatomic, strong)IBOutlet UITextField *favouriteColour;
@property(nonatomic, strong) IBOutlet UIImageView *imageView;
@end

