//
//  ShareViewController.h
//  FinalProject
//
//  Created by Habibullah Ghazniwa on 2017-03-12.
//  Copyright © 2017 Habibullah Ghazniwa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "AppDelegate.h"
@interface ShareViewController : UIViewController <MFMailComposeViewControllerDelegate, UITextFieldDelegate>{
    IBOutlet UIImageView *imageView;
    IBOutlet UIImage *sendImage;
    IBOutlet UITextField *emailAd;
    IBOutlet UITextView *personalMsg;
    AppDelegate *mainDelegate;
}

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImage *sendImage;
@property (nonatomic, strong) UITextField *emailAd;
@property (nonatomic, strong) UITextView *personalMsg;
@property (nonatomic, strong) AppDelegate *mainDelegate;
-(IBAction)sendViaEmail:(id)sender;
@end
