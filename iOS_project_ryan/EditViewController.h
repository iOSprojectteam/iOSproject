//
//  EditViewController.h
//  iOS_project_ryan
//
//  Created by Galimova Galina on 2017-03-12.
//  Copyright © 2017 Ryan Falcon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController <UITextFieldDelegate>
{
    IBOutlet UITextField *tfText;
}
@property (nonatomic, strong) IBOutlet UITextField *tfText;


@end
