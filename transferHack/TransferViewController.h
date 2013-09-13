//
//  TransferViewController.h
//  transferHack
//
//  Created by Johnson, John (CONT) on 9/13/13.
//  Copyright (c) 2013 Capital One. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransferViewController : UIViewController
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *topCollectionView;
@property (strong, nonatomic) UIImageView *imageCel;
@property (strong, nonatomic) UICollectionViewCell *topViewCell;
@property (strong, nonatomic) UIImage *targetImage;
@end
