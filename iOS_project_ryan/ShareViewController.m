//
//  ShareViewController.m
//  FinalProject
//
//  Created by Habibullah Ghazniwa on 2017-03-12.
//  Copyright © 2017 Habibullah Ghazniwa. All rights reserved.
//

#import "ShareViewController.h"
#import <Social/Social.h>

@interface ShareViewController () <MFMailComposeViewControllerDelegate>

@end

@implementation ShareViewController
@synthesize sendImage, imageView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)postMe:(id)sender{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *fbPost = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [fbPost setInitialText:@"Testing123"];
        [fbPost setCompletionHandler:^(SLComposeViewControllerResult result){
            if (result == SLComposeViewControllerResultCancelled) {
                NSLog(@"User Cancelled-------------------------");
            }else if(result == SLComposeViewControllerResultDone){
                NSLog(@"User posted to fb----------------------");
            }
        }];
        [self presentViewController:fbPost animated:YES completion:nil];
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"YAYY" message:@"Failed" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}

-(IBAction)sendViaEmail:(id)sender{

    if (![MFMailComposeViewController canSendMail]) {
        NSLog(@"Mail services are not available.");
        return;
    }
    
    MFMailComposeViewController* composeVC = [[MFMailComposeViewController alloc] init];
    composeVC.mailComposeDelegate = self;
    
    // Configure the fields of the interface.
    [composeVC setToRecipients:@[@"address@example.com"]];
    [composeVC setSubject:@"Hello!"];
    [composeVC setMessageBody:@"Hello from California!" isHTML:NO];
    
    // Present the view controller modally.
    [self presentViewController:composeVC animated:YES completion:nil];

}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
        NSLog(@"Mail cancelled");
        break;
        case MFMailComposeResultSaved:
        NSLog(@"Mail saved");
        break;
        case MFMailComposeResultSent:
        NSLog(@"Mail sent");
        break;
        case MFMailComposeResultFailed:
        NSLog(@"Mail sent failure: %@", [error localizedDescription]);
        break;
        default:
        break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
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
