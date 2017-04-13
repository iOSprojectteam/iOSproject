//
//  ShareViewController.h
//  FinalProject
//
//  Created by Habibullah Ghazniwa on 2017-03-12.
//  Copyright © 2017 Habibullah Ghazniwa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ShareViewController : UIViewController <MFMailComposeViewControllerDelegate>{
    UIImageView *imageView;
    UIImage *sendImage;
}

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImage *sendImage;
-(IBAction)sendViaEmail:(id)sender;
@end
