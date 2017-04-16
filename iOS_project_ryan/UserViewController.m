//
//  ViewController.m
//  FinalProject
//
//  Created by Xcode User on 2017-03-13.
//  Copyright © 2017 Bradley Zwarich. All rights reserved.
//  User .M File
//  Note: I do not claim I did all the code myself, I used stackexchange to complete the code when needed

#import "UserViewController.h"

@interface UserViewController ()

@end

@implementation UserViewController
@synthesize avatar, name, favouriteFont, favouriteColour, imageView;

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

// gets the user settings, so that defaults aee loaded
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //fill in the user defaults
    self.favouriteColour.text = [[NSUserDefaults standardUserDefaults]stringForKey:@"colour"];
    self.favouriteFont.text = [[NSUserDefaults standardUserDefaults]stringForKey:@"font"];
    self.name.text = [[NSUserDefaults standardUserDefaults]stringForKey:@"name"];
    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"avatar"];
    UIImage* imageInsert = [UIImage imageWithData:imageData];
    self.imageView.image = imageInsert;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
    Save into user defaults the data that was passed
*/
-(IBAction)savePreferences
{
    [[NSUserDefaults standardUserDefaults] setObject:self.favouriteColour.text forKey:@"colour"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSUserDefaults standardUserDefaults] setObject:self.favouriteFont.text forKey:@"font"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSUserDefaults standardUserDefaults] setObject:self.name.text forKey:@"name"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    // I believe this isn't ideal to do, as plist doesn't seem it's meant for storing pictures, but I wasn't sure what the best alternative was
    [[NSUserDefaults standardUserDefaults] setObject:UIImagePNGRepresentation(imageView.image) forKey:@"avatar"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
// This code is meant to load the imagepicker
-(IBAction)selectPhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    
}
// This code is meant to deal with the image chosen so that it can be loaded
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

@end
