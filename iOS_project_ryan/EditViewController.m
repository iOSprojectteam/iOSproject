//
//  EditViewController.m
//  iOS_project_ryan
//
//  Created by Ryan Galimova on 2017-03-12.
//  Copyright © 2017 Ryan Galimova. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()


@end

@implementation EditViewController
@synthesize tfText, mainImageView, stickerThumbs, mainDelegate;

#pragma mark collection_view

// number of items in sticker array
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return stickerThumbs.count;
}

// display sticker thumbnails in collection view
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *stickerThumbImageView = (UIImageView *)[cell viewWithTag:50];
    stickerThumbImageView.image = [UIImage imageNamed:[stickerThumbs objectAtIndex:indexPath.row]];
    
    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sticker-background-selected.png"]];
    
    return cell;
}

// handle sticker selection from collection view
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Determine the selected sticker by using the indexPath
    // NSLog(@"%ld, %ld", (long)indexPath.section, (long)indexPath.row);
    NSString *selectedSticker = [stickerThumbs objectAtIndex:indexPath.row];

    Sticker *newSticker = [[PictureProcessor sharedPictureProcessor] createStickerAtRandomPosition:mainDelegate.originalImage name:selectedSticker];

    // Add the selected sticker into the array
    [mainDelegate.addedStickers addObject:newSticker];
    [self redraw];
}

#pragma mark edit_view

- (void)viewDidLoad {
    [super viewDidLoad];
    mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    // Do any additional setup after loading the view.
    

    stickerThumbs = [NSArray arrayWithObjects:@"Funny-Face_Glasses.png", @"glass-tina-fey.png", @"glasses_pink", @"hammer_PNG3888.png", @"hat.png", @"heart.png", @"sparkle.png", @"Star-PNG-Clipart.png", @"sword-png-16.png", @"Funny-Face_Glasses.png", @"glass-tina-fey.png", @"glasses_pink", @"hammer_PNG3888.png", @"hat.png", @"heart.png", @"sparkle.png", @"Star-PNG-Clipart.png", @"sword-png-16.png", @"person.png", nil];
    
    // load picture from camera or use default
    if (mainDelegate.originalImage == NULL)
        [self setupWithImage: [UIImage imageNamed:@"person.png"]];
    else
        [self setupWithImage:mainDelegate.originalImage];
}

// put the loaded picture to imageView and apply stickers and labels
- (void)setupWithImage:(UIImage*)image {
    UIImage * fixedImage = [image imageWithFixedOrientation];
    mainDelegate.originalImage = fixedImage;
    self.mainImageView.image = fixedImage;
    
    // Commence with processing!
    [PictureProcessor sharedPictureProcessor].delegate = self;
    
    [self redraw];
}

// apply stickers and labels
-(void) redraw{
    [[PictureProcessor sharedPictureProcessor] placeStickers:mainDelegate.originalImage stickers:mainDelegate.addedStickers labels:mainDelegate.addedLabels];
    
}

// delete last sticker
-(IBAction)deleteSticker:(id)sender
{
    [mainDelegate.addedStickers removeObject:mainDelegate.addedStickers.lastObject];
    [self redraw];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// switch between two views in the view container
- (IBAction)showComponent:(UIButton *)sender {
    if ([sender.titleLabel.text  isEqual: @"Add Sticker"]) {
        [UIView animateWithDuration:(0.5) animations:^{
            self.containerViewA.alpha = 1;
            self.containerViewB.alpha = 0;
        }];
    } else {
        [UIView animateWithDuration:(0.5) animations:^{
            self.containerViewA.alpha = 0;
            self.containerViewB.alpha = 1;
        }];
    }
}
-(IBAction)unwindToThisEditViewController:(UIStoryboardSegue *)sender
{
    
}

// hide keyboard
-(bool)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

// save picture to history and to camera roll
- (IBAction)savePhoto:(UIBarButtonItem *)sender {
    if (!self.mainImageView.image) {
        return;
    }
    // save to camera roll
    UIImageWriteToSavedPhotosAlbum(self.mainImageView.image, nil, nil, nil);
    
    //save to history
    Picture *p = [[Picture alloc] initWithData: mainDelegate.originalImage theLabels: mainDelegate.addedLabels theStickers:mainDelegate.addedStickers theRenderedImg: self.mainImageView.image];
    [mainDelegate.pictureHistory addObject:p];

    
}

// add label and redraw
- (IBAction)addLabel:(id)sender {
    Label *newLabel = [[Label alloc] initWithText: tfText.text];
    [mainDelegate.addedLabels addObject:newLabel];
    [tfText setText:@""];
    [self redraw];

}

// delete last label
- (IBAction)deleteLabel:(id)sender {
    [mainDelegate.addedLabels removeObject:mainDelegate.addedLabels.lastObject];
    [self redraw];

}

#pragma mark Protocol Conformance

// callback from picture processor, puts the rendered image to the image view
- (void)didFinishedPlacingStickers:(UIImage *)outputPicture {
    self.mainImageView.image = outputPicture;
}
 
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
