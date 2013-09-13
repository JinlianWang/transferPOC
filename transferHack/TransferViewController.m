//
//  TransferViewController.m
//  transferHack
//
//  Created by Johnson, John (CONT) on 9/13/13.
//  Copyright (c) 2013 Capital One. All rights reserved.
//

#import "TransferViewController.h"
#import "AccountCell.h"
#import "UIView+ImageCopy.h"
#import <QuartzCore/QuartzCore.h>


@interface TransferViewController ()

@property (nonatomic,strong) AccountCell *selectedTopCell;
@property (nonatomic,strong) AccountCell *selectedBottomCell;
@property(nonatomic, strong) CALayer *overlay;

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
    [cell.AccountName setText:@"CASH REWARDS"];
    [cell.creditCard setText:@"...8523"];
    [cell.accountAmount setText:@"$300.00"];
    
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didselect");
    [[collectionView cellForItemAtIndexPath:indexPath] setBackgroundColor:[UIColor blueColor]];
    [[collectionView cellForItemAtIndexPath:indexPath].backgroundView setTag:1];
    self.selectedTopCell = (AccountCell*)[collectionView cellForItemAtIndexPath:indexPath];
    [self moveImage];
 
}

-(void) moveImage
{
    UIImage *sourceImage = [self.selectedTopCell cofImageContents];
    self.overlay.contents = (id)sourceImage.CGImage;
    CGRect topRect = CGRectMake(self.selectedTopCell.center.x - sourceImage.size.width/2, self.selectedTopCell.center.y - sourceImage.size.height/2, sourceImage.size.width, sourceImage.size.height);
    CGImageRef topImage = CGImageCreateWithImageInRect(sourceImage.CGImage, topRect);
    self.overlay.bounds = topRect;
    self.overlay.contents = (__bridge id)topImage;
    
    CGFloat animDuration = 1.0f;
    NSString *animName = @"moveAnim";
    
    [CATransaction begin];
    {
        [CATransaction setAnimationDuration:1.0f];
        {
            CABasicAnimation *frontFold = [CABasicAnimation
                                           animationWithKeyPath:@"transform.translation.x"];
            frontFold.duration = animDuration;
            frontFold.fillMode = kCAFillModeForwards;
            frontFold.fromValue = [NSNumber numberWithFloat:self.selectedTopCell.center.x];
            frontFold.toValue = [NSNumber numberWithFloat:100.0f];
            frontFold.removedOnCompletion = NO;
            [self.overlay addAnimation:frontFold forKey:animName];
            
            CABasicAnimation *backFold = [CABasicAnimation
                                          animationWithKeyPath:@"transform.translation.y"];
            backFold.duration = animDuration;
            backFold.fillMode = kCAFillModeForwards;
            backFold.fromValue = [NSNumber numberWithFloat:self.selectedTopCell.center.x];
            backFold.toValue = [NSNumber numberWithFloat:0.0f];
            backFold.removedOnCompletion = NO;
            [self.overlay addAnimation:backFold forKey:animName];
        }
    }
    [CATransaction commit];
    
}

-(void)collectionView:(UICollectionView *)collectionView diddeSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didselect");
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(233,203);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0.0, 10.0, 0.0, 10.0);
}



@end
