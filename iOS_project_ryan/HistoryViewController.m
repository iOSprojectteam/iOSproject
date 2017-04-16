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
@synthesize sampleAr, mainDelgate, selectedPic;

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return mainDelgate.pictureHistory.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell1";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:8];
    Picture *pic = [mainDelgate.pictureHistory objectAtIndex:indexPath.row];
    recipeImageView.image = pic.renderedImg;
    
    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sticker-background-selected.png"]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    // Determine the selected sticker by using the indexPath
    // NSLog(@"%ld, %ld", (long)indexPath.section, (long)indexPath.row);
    selectedPic = [mainDelgate.pictureHistory objectAtIndex:indexPath.row];
    mainDelgate.selectedImg = selectedPic;
    
}

-(IBAction)goToShare:(id)sender{
    UIViewController *shareVC = [[UIViewController alloc] init];
    [self.navigationController pushViewController:shareVC animated:YES];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    mainDelgate = (AppDelegate  *) [[UIApplication sharedApplication] delegate];
    
    //[NSArray arrayWithObjects:@"Funny-Face_Glasses.png", @"glass-tina-fey.png", @"glasses_pink", @"hammer_PNG3888.png", @"hat.png", @"heart.png", @"sparkle.png", @"Star-PNG-Clipart.png", @"sword-png-16.png", @"Funny-Face_Glasses.png", @"glass-tina-fey.png", @"glasses_pink", @"hammer_PNG3888.png", @"hat.png", @"heart.png", @"sparkle.png", @"Star-PNG-Clipart.png", @"sword-png-16.png", @"person.png", nil];
    
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
