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
@synthesize mainDelgate, selectedPic;

// This method is to get the number of pictures for the collection view
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return mainDelgate.pictureHistory.count;
}

// this is to create cells for the collection view
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell1";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:8];
    Picture *pic = [mainDelgate.pictureHistory objectAtIndex:indexPath.row];
    recipeImageView.image = pic.renderedImg;
    
    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sticker-background-selected.png"]];
    return cell;
}

//this method is to unwind to history view
-(IBAction)unwindToThisHistoryController:(UIStoryboardSegue *)sender{
    
}


//This method is for selecting an item from collection view
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    selectedPic = [mainDelgate.pictureHistory objectAtIndex:indexPath.row];
    mainDelgate.selectedImg = selectedPic;
    
}

//this method is to set up main delegate objects so that they can be re-editted in edit view.
-(IBAction)editAgain:(id)sender{
    mainDelgate.originalImage = selectedPic.mainImg;
    mainDelgate.addedLabels = selectedPic.lblArray;
    mainDelgate.addedStickers = selectedPic.stkArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    mainDelgate = (AppDelegate  *) [[UIApplication sharedApplication] delegate];
    

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
