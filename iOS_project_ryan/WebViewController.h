//
//  WebViewController.h
//  iOS_project_ryan
//
//  Created by Charles Javelona. on 2017-03-12.
//  Copyright © 2017 Charles Javelona. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate>
{
    IBOutlet UIActivityIndicatorView *activity;
    IBOutlet UIWebView *webView;
}

@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activity;
@property (nonatomic, strong) IBOutlet UIWebView *webView;

@end
