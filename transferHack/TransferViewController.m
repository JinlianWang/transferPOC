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
@synthesize topViewCell;


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



-(void) moveImage
{
    //[image1 setCenter: CGPointMake(634, 126)];
    CGPoint pointOne=CGPointMake(634, 126);
    
    self.imageCel.animationDuration = 5;
    self.imageCel.center=pointOne;
    
    
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

 

    if(collectionView == self.collectionView){
        NSLog(@"Selected Bottom");
        
        UICollectionViewCell *bottomCell = [collectionView cellForItemAtIndexPath:indexPath];
        CGRect desPos = [bottomCell convertRect:bottomCell.bounds toView:self.view];
        //CGRect desPos = [bottomCell frame];
        CGRect srcPos = [self.topViewCell convertRect:topViewCell.bounds toView:self.view];
        
        self.imageCel=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"account-bg"]];
        [self.imageCel setFrame:srcPos];
        [self.view addSubview:self.imageCel];
        
        
        [UIView animateWithDuration:1.0f delay:0.0f options:UIViewAnimationTransitionNone|UIViewAnimationOptionCurveLinear animations:^{
            [self.imageCel setFrame:desPos];
        } completion:^(BOOL finished){
            [self.imageCel removeFromSuperview];
        }];
        
    } else {
        self.topViewCell = [collectionView cellForItemAtIndexPath:indexPath];
    }

    
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(233,203);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0.0, 10.0, 0.0, 10.0);
}



@end
