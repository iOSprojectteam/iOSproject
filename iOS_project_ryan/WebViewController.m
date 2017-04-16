//
//  WebViewController.m
//  iOS_project_ryan
//
//  Created by Galimova Galina on 2017-03-12.
//  Copyright © 2017 Ryan Falcon. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController
@synthesize  webView, activity;


/**
    Open stat
 
 */
-(void)webViewDidStartLoad:(UIWebView *) webView
{
    [activity setHidden: NO];
    [activity startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activity setHidden:YES];
    [activity stopAnimating];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURL *urlAddress = [NSURL URLWithString:@"https://www.google.ca"];
    NSURLRequest *url = [NSURLRequest requestWithURL:urlAddress];
    [webView loadRequest:url];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
