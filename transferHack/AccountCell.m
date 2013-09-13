//
//  AccountCell.m
//  transferHack
//
//  Created by Johnson, John (CONT) on 9/13/13.
//  Copyright (c) 2013 Capital One. All rights reserved.
//

#import "AccountCell.h"
#define kMTLabelBottomWidth 100.0
#define kMTLabelBottomHeight 100.0
@interface AccountCell ()
@end
@implementation AccountCell
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Helpers
        CGSize size = self.contentView.frame.size;
        // Initialize Label Time
        self.AccountName = [[UILabel alloc] initWithFrame:CGRectMake(60.0, 0.0, 100.0, 40.0)];
        // Configure Label Time
        [self.AccountName setBackgroundColor:[UIColor clearColor]];
        [self.AccountName setTextColor:[UIColor blackColor]];
        [self.AccountName setFont:[UIFont fontWithName:@"GillSans-Light" size:18.0]];
        [self.AccountName setAutoresizingMask:(UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin)];
        [self.contentView addSubview:self.AccountName];
//    
//        // Background View
////        UIImage *backgroundImage = [[UIImage imageNamed:@"background-hour-cell"] resizableImageWithCapInsets:UIEdgeInsetsMake(40.0, 10.0, 10.0, 10.0)];
////        UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, size.width, size.height)];
////        [backgroundView setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
////        [backgroundView setImage:backgroundImage];
////        [self setBackgroundView:backgroundView];
    
    }
    return self;
}
@end
