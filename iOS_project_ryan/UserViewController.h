//
//  ViewController.h
//  FinalProject
//
//  Created by Xcode User on 2017-03-13.
//  Copyright © 2017 Bradley Zwarich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserViewController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UIImageView *avatar;
    IBOutlet UITextField *name;
    IBOutlet UITextField *favouriteFont;
    IBOutlet UITextField *favouriteColour;

}
@property(nonatomic, strong)IBOutlet UIImageView *avatar;
@property(nonatomic, strong)IBOutlet UITextField *name;
@property(nonatomic, strong)IBOutlet UITextField *favouriteFont;
@property(nonatomic, strong)IBOutlet UITextField *favouriteColour;

@end

