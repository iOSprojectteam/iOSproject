//
//  ViewController.m
//  FinalProject
//
//  Created by Xcode User on 2017-03-13.
//  Copyright © 2017 Bradley Zwarich. All rights reserved.
//

#import "UserViewController.h"

@interface UserViewController ()

@end

@implementation UserViewController
@synthesize avatar, name, favouriteFont, favouriteColour;

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.favouriteColour.text = [[NSUserDefaults standardUserDefaults]stringForKey:@"colour"];
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
}
@end
