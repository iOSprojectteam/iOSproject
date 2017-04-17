//
//  FontViewController.m
//  iOS_project_ryan
//
//  Created by Charles Javelona on 2017-03-12.
//  Copyright © 2017 Charles Javelona. All rights reserved.
//

#import "FontViewController.h"


@interface FontViewController ()

@end

@implementation FontViewController
@synthesize  mainDelegate, label, size;

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

/** 
    Font change button
 */
- (IBAction)fontChange:(id)sender {
    
    /**
     
        //Take last element in the array of labels and apply:
            - Font size
            - Font color
        //
     */
    // Add the selected sticker into the array
    
    NSLog(@"TESTING %@", label.text);
    //Get actual numbers next time
    
    NSLog(@"Value %@", self.valueLabel.text);
    NSLog(@"Value %@", self.color.text);
    
    self.label.color = self.color.textColor;
    if (self.size != 0) {
        self.label.fontSize = self.size;
    }
}

/*
    Change values on font sizes
 **/
- (IBAction)stepperValueChanged:(UIStepper *)sender {
    NSUInteger value = sender.value;
    self.valueLabel.text = [NSString stringWithFormat:@"%02lu", (unsigned long)value];
    self.size = value;
    
}



/**
 returns the number of 'columns' to display.
 */
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

/**
 returns the # of rows in each component.
 */
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component {
    return 6;
}

/**
    Returns the row item in the pickerview
 */
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component {
    return [self.colorArray objectAtIndex:row];
}

/**
    Processes the color users pick and displays it
 */
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component {
    NSLog(@"Selected Row %ld", (long)row);
    switch(row)
    {
            
        case 0:
            self.color.text = @"Blue #0000FF";
            self.color.textColor = [UIColor colorWithRed:0.0f/255.0f green: 0.0f/255.0f blue:255.0f/255.0f alpha:255.0f/255.0f];
            break;
        case 1:
            self.color.text = @"Green #00FF00";
            self.color.textColor = [UIColor colorWithRed:0.0f/255.0f green: 255.0f/255.0f blue:0.0f/255.0f alpha:255.0f/255.0f];
            break;
        case 2:
            self.color.text = @"Orange #FF681F";
            self.color.textColor = [UIColor colorWithRed:205.0f/255.0f green:   140.0f/255.0f blue:31.0f/255.0f alpha:255.0f/255.0f];
            break;
        case 3:
            self.color.text = @"Purple #FF00FF";
            self.color.textColor = [UIColor colorWithRed:255.0f/255.0f green:   0.0f/255.0f blue:255.0f/255.0f alpha:255.0f/255.0f];
            break;
        case 4:
            self.color.text = @"Red #FF0000";
            self.color.textColor = [UIColor colorWithRed:255.0f/255.0f green:   0.0f/255.0f blue:0.0f/255.0f alpha:255.0f/255.0f];
            break;
        case 5:
            self.color.text = @"Yellow #FFFF00";
            self.color.textColor = [UIColor colorWithRed:255.0f/255.0f green:   255.0f/255.0f blue:0.0f/255.0f alpha:255.0f/255.0f];
            break;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.label = [mainDelegate.addedLabels lastObject];

    [self.picker selectRow:0 inComponent:0 animated:YES];
    self.color.text = @"Blue #0000FF";
    self.color.textColor = [UIColor colorWithRed:0.0f/255.0f green: 0.0f/255.0f blue:255.0f/255.0f alpha:255.0f/255.0f];
    
    self.colorArray  = [[NSArray alloc]         initWithObjects:@"Blue",@"Green",@"Orange",@"Purple",@"Red",@"Yellow" , nil];
    
    NSUInteger value;
    self.stepper.wraps = YES; self.stepper.autorepeat = YES;
    if (label.fontSize == 0){
        self.stepper.value =  24;
        value = 24;
    } else {
        self.stepper.value =  label.fontSize;
        value = label.fontSize;

    }
    
    self.valueLabel.text = [NSString stringWithFormat:@"%02lu", (unsigned long)value];
    self.stepper.maximumValue = 100;
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
