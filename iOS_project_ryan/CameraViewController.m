//
//  CameraViewController.m
//  FinalProject
//
//  Created by Xcode User on 2017-03-29.
//  Copyright © 2017 Bradley Zwarich. All rights reserved.
//  This class is meant for taking a picture, and saving the picture
//  Note: I do not claim I did all the code myself, I used stackexchange to complete the code when needed

#import "CameraViewController.h"

@interface CameraViewController ()

@end

@implementation CameraViewController
@synthesize  imageView, mainDelegate;
- (void)viewDidLoad {
    [super viewDidLoad];
    mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// deals with the picture, so that it can be stored to the image view
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    mainDelegate.originalImage = chosenImage;
    self.imageView.image = chosenImage;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
// Loads the picker which then can allow the source type to be the camera to take the picture
- (IBAction)takePhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    
    [self presentViewController:picker animated:YES completion:NULL];
    
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
