//
//  HistoryViewController.m
//  FinalProject
//
//  Created by Habibullah Ghazniwa on 2017-03-12.
//  Copyright © 2017 Habibullah Ghazniwa. All rights reserved.
//

#import "HistoryViewController.h"

@interface HistoryViewController ()

@end

@implementation HistoryViewController
@synthesize sampleAr;

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return sampleAr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:8];
    recipeImageView.image = [UIImage imageNamed:[sampleAr objectAtIndex:indexPath.row]];
    
    
    return cell;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    sampleAr = [NSArray arrayWithObjects:@"Funny-Face_Glasses.png", @"glass-tina-fey.png", @"glasses_pink", @"hammer_PNG3888.png", @"hat.png", @"heart.png", @"sparkle.png", @"Star-PNG-Clipart.png", @"sword-png-16.png", @"Funny-Face_Glasses.png", @"glass-tina-fey.png", @"glasses_pink", @"hammer_PNG3888.png", @"hat.png", @"heart.png", @"sparkle.png", @"Star-PNG-Clipart.png", @"sword-png-16.png", @"person.png", nil];
    
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
