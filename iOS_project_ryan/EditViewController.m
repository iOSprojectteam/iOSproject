//
//  EditViewController.m
//  iOS_project_ryan
//
//  Created by Galimova Galina on 2017-03-12.
//  Copyright © 2017 Ryan Falcon. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerViewA;
@property (weak, nonatomic) IBOutlet UIView *containerViewB;

@end

@implementation EditViewController
@synthesize tfText;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
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


 
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
