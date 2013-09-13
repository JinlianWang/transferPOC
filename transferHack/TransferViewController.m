//
//  TransferViewController.m
//  transferHack
//
//  Created by Johnson, John (CONT) on 9/13/13.
//  Copyright (c) 2013 Capital One. All rights reserved.
//

#import "TransferViewController.h"
#import "AccountCell.h"

@interface TransferViewController ()

@end

@implementation TransferViewController
static NSString *ACCell = @"ACCell";

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
     // Configure Collection View
    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    [self.collectionView registerClass:[AccountCell class] forCellWithReuseIdentifier:ACCell];
    [self.topCollectionView setBackgroundColor:[UIColor clearColor]];
    [self.topCollectionView registerClass:[AccountCell class] forCellWithReuseIdentifier:ACCell];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 6;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AccountCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ACCell forIndexPath:indexPath];
    
    // Configure Cell
    [cell.AccountName setText:@"Test Account"];
    [cell.creditCard setText:@"...8523"];
    [cell.accountAmount setText:@"$300.00"];
    
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(200.0, 200.0);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0.0, 10.0, 0.0, 10.0);
}




@end
