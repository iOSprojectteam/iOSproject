//
//  EditViewController.m
//  iOS_project_ryan
//
//  Created by Galimova Galina on 2017-03-12.
//  Copyright © 2017 Ryan Falcon. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()


@end

@implementation EditViewController
@synthesize tfText, mainImageView, originalImage, stickerThumbs, addedStickers;

#pragma mark collection_view

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

    Sticker *newSticker = [[PictureProcessor sharedPictureProcessor] createStickerAtRandomPosition:originalImage name:selectedSticker];

    // Add the selected sticker into the array
    [addedStickers addObject:newSticker];
    [[PictureProcessor sharedPictureProcessor] placeStickers:originalImage stickers:addedStickers];
}

#pragma mark edit_view

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    addedStickers = [NSMutableArray array];
    stickerThumbs = [NSArray arrayWithObjects:@"Funny-Face_Glasses.png", @"glass-tina-fey.png", @"glasses_pink", @"hammer_PNG3888.png", @"hat.png", @"heart.png", @"sparkle.png", @"Star-PNG-Clipart.png", @"sword-png-16.png", @"Funny-Face_Glasses.png", @"glass-tina-fey.png", @"glasses_pink", @"hammer_PNG3888.png", @"hat.png", @"heart.png", @"sparkle.png", @"Star-PNG-Clipart.png", @"sword-png-16.png", @"person.png", nil];
    [self setupWithImage: [UIImage imageNamed:@"person.png"]];
}

- (void)setupWithImage:(UIImage*)image {
    UIImage * fixedImage = [image imageWithFixedOrientation];
    self.originalImage = fixedImage;
    self.mainImageView.image = fixedImage;
    
    // Commence with processing!
    [PictureProcessor sharedPictureProcessor].delegate = self;
    [[PictureProcessor sharedPictureProcessor] placeStickers:fixedImage stickers:addedStickers];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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

-(bool)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)savePhoto:(UIBarButtonItem *)sender {
    if (!self.mainImageView.image) {
        return;
    }
    UIImageWriteToSavedPhotosAlbum(self.mainImageView.image, nil, nil, nil);
}

#pragma mark Protocol Conformance

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
