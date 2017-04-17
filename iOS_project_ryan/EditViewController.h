//
//  EditViewController.h
//  iOS_project_ryan
//
//  Created by Ryan Galimova on 2017-03-12.
//  Copyright © 2017 Ryan Galimova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PictureProcessor.h"
#import "UIImage+OrientationFix.h"
#import "Sticker.h"
#import "Label.h"
#import "AppDelegate.h"
#import "Picture.h"

@interface EditViewController : UIViewController <UITextFieldDelegate, UICollectionViewDelegate, UICollectionViewDataSource, PictureProcessorDelegate>
{
    IBOutlet UITextField *tfText;
    IBOutlet UIImageView *mainImageView;
    // array of image names for stickers
    NSArray *stickerThumbs;

    AppDelegate *mainDelegate;

    
}
@property (nonatomic, strong) IBOutlet UITextField *tfText;
@property (nonatomic, strong) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UIView *containerViewA;
@property (weak, nonatomic) IBOutlet UIView *containerViewB;
@property (strong, nonatomic) UIImage *originalImage;
@property (strong, nonatomic) NSArray *stickerThumbs;

@property (nonatomic, strong) AppDelegate *mainDelegate;

-(IBAction)deleteSticker:(id)sender;
@end
