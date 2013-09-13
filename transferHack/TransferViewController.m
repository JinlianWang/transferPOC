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
#import "CustomGestureViewController.h"
#import "AppDelegate.h"


@interface TransferViewController () {
    NSInteger count;
}

@property (nonatomic,strong) AccountCell *selectedTopCell;
@property (nonatomic,strong) AccountCell *selectedBottomCell;
@property(nonatomic, strong) CALayer *overlay;

@end

@implementation TransferViewController
static NSString *ACCell = @"ACCell";
@synthesize topViewCell;
@synthesize targetImage;


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
    
    count=0;
}

-(void)viewDidAppear:(BOOL)animated{
  
    
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
    
    //initialize to use in the class
    NSArray *listOfAccountNames;
    NSArray *listOfAccountBalances;
    NSArray *listOfAccountNums;
    // in viewDidLoad
    listOfAccountNames = [NSArray arrayWithObjects:@"CASH REWARDS",@"VENTURE REWARDS",@"PLATINUM CARD", @"360 CHECKING", @"360 SAVINGS", @"HIGH YIELD MONEY MARKET", nil];
    listOfAccountBalances = [NSArray arrayWithObjects:@"$502.43",@"$5,000.00", @"$784.02", @"$910.31", @"$829.01", @"$1,324.15",nil];
    listOfAccountNums = [NSArray arrayWithObjects:@"...2534", @"...8763", @"...2356", @"...0234", @"...8345", @"...2236",nil];
    
    
    //in cellForItemAtIndexPath
    [cell.AccountName setText:[listOfAccountNames objectAtIndex:count]];
    [cell.creditCard setText:[listOfAccountNums objectAtIndex:count]];
    [cell.accountAmount setText:[listOfAccountBalances objectAtIndex:count]];
    count++;
    if(count == 6) {
        count = 0;
    }
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    

    NSLog(@"didselect");

    [[collectionView cellForItemAtIndexPath:indexPath] setBackgroundColor:[UIColor colorWithRed:0.0/255.0 green:58.0/255.0 blue:111.0/255.0 alpha:1.0]];
    
    [[collectionView cellForItemAtIndexPath:indexPath].backgroundView setTag:1];

 

    if(collectionView == self.collectionView){
        NSLog(@"Selected Bottom");
        
        UICollectionViewCell *bottomCell = [collectionView cellForItemAtIndexPath:indexPath];
        CGRect desPos = [bottomCell convertRect:bottomCell.bounds toView:self.view];
        //CGRect desPos = [bottomCell frame];
        CGRect srcPos = [self.topViewCell convertRect:topViewCell.bounds toView:self.view];
        
        self.imageCel=[[UIImageView alloc] initWithImage:self.targetImage];
        [self.imageCel setFrame:srcPos];
        [self.view addSubview:self.imageCel];
        
        
        [UIView animateWithDuration:0.5f delay:0.0f options:UIViewAnimationTransitionNone|UIViewAnimationOptionCurveLinear animations:^{
            [self.imageCel setFrame:desPos];
        } completion:^(BOOL finished){
            [self.imageCel removeFromSuperview];
            CustomGestureViewController *customController = [[CustomGestureViewController alloc] init];
            AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            [delegate.navController pushViewController:customController animated:YES];
        }];
        
    } else {
        
        self.topViewCell = [collectionView cellForItemAtIndexPath:indexPath];
        self.targetImage = [self.topViewCell cofImageContents];
    }

    
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(233,203);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0.0, 10.0, 0.0, 10.0);
}

-(void)resetSelection{
    NSArray *array = [self.collectionView visibleCells];
    for(int i=0;i<[array count];i++){
        UICollectionViewCell *cell = (UICollectionViewCell *)[array objectAtIndex:i];
        [cell setBackgroundColor:[UIColor clearColor]];
    }
    
    array = [self.topCollectionView visibleCells];
    for(int i=0;i<[array count];i++){
        UICollectionViewCell *cell = (UICollectionViewCell *)[array objectAtIndex:i];
        [cell setBackgroundColor:[UIColor clearColor]];
    }
}

@end
