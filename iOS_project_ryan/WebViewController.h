//
//  WebViewController.h
//  iOS_project_ryan
//
//  Created by Habib Ghazniwal on 2017-03-12.
//  Copyright © 2017 Habib Ghazniwal. All rights reserved.
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
