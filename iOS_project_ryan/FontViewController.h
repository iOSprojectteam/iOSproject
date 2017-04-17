//
//  FontViewController.h
//  iOS_project_ryan
//
//  Created by Charles Javelona on 2017-03-12.
//  Copyright © 2017 Charles Javelona. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Label.h"

@interface FontViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
    AppDelegate *mainDelegate;
    Label * label;

}
@property (strong, nonatomic) IBOutlet UILabel *color;
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (nonatomic, strong) IBOutlet UITextField *fontSize;

@property (strong, nonatomic) NSArray *colorArray;

@property (nonatomic, weak) IBOutlet UILabel *valueLabel;
@property (nonatomic, weak) IBOutlet UIStepper *stepper;
@property (nonatomic, strong) AppDelegate *mainDelegate;
@property (nonatomic, strong) Label * label;


@end
