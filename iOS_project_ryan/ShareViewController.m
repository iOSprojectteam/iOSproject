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
@synthesize sendImage, imageView, emailAd, personalMsg, mainDelegate;
- (void)viewDidLoad {
    [super viewDidLoad];
    mainDelegate = (AppDelegate  *) [[UIApplication sharedApplication] delegate];
    [imageView setImage:mainDelegate.selectedImg.renderedImg];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)postMe:(id)sender{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *fbPost = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [fbPost setInitialText: personalMsg.text];
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
    
    MFMailComposeViewController* myMail = [[MFMailComposeViewController alloc] init];
    myMail.mailComposeDelegate = self;
    
    // Configure the fields of the interface.
    
    //NSData *myImg = mainDelegate.selectedImg.renderedImg;
    NSData *imageData = UIImagePNGRepresentation(mainDelegate.selectedImg.renderedImg);
    [myMail addAttachmentData:imageData mimeType:@"image/png" fileName:@"photo"];
    [myMail setToRecipients:@[emailAd.text]];
    [myMail setSubject:@"Check this out!"];
    [myMail setMessageBody: personalMsg.text isHTML:NO];
    
    // Present the view controller modally.
    [self presentViewController:myMail animated:YES completion:nil];

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
