//
//  EditViewController.h
//  iOS_project_ryan
//
//  Created by Galimova Galina on 2017-03-12.
//  Copyright © 2017 Ryan Falcon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PictureProcessor.h"
#import "UIImage+OrientationFix.h"
#import "Sticker.h"

@interface EditViewController : UIViewController <UITextFieldDelegate, UICollectionViewDelegate, UICollectionViewDataSource, PictureProcessorDelegate>
{
    IBOutlet UITextField *tfText;
    IBOutlet UIImageView *mainImageView;
    // array of image names for stickers
    NSArray *stickerThumbs;
    // array of selected stickers
    NSMutableArray *addedStickers;
    UIImage *originalImage;
}
@property (nonatomic, strong) IBOutlet UITextField *tfText;
@property (nonatomic, strong) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UIView *containerViewA;
@property (weak, nonatomic) IBOutlet UIView *containerViewB;
@property (strong, nonatomic) UIImage *originalImage;
@property (strong, nonatomic) NSArray *stickerThumbs;
// array of selected stickers
@property (strong, nonatomic) NSMutableArray *addedStickers;

@end
