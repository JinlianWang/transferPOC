//
//  AccountCell.m
//  transferHack
//
//  Created by Johnson, John (CONT) on 9/13/13.
//  Copyright (c) 2013 Capital One. All rights reserved.
//

#import "AccountCell.h"
#define kMTLabelBottomWidth 40.0
#define kMTLabelBottomHeight 40.0
@interface AccountCell ()
@end
@implementation AccountCell
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Helpers
        CGSize size = self.contentView.frame.size;
        // Initialize Account Name
        self.AccountName = [[UILabel alloc] initWithFrame:CGRectMake(60.0, 0.0, 100.0, 40.0)];
        // Configure Account Name
        [self.AccountName setBackgroundColor:[UIColor clearColor]];
        [self.AccountName setTextColor:[UIColor blackColor]];
        [self.AccountName setFont:[UIFont fontWithName:@"GillSans-Light" size:18.0]];
        [self.AccountName setAutoresizingMask:(UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin)];
        [self.contentView addSubview:self.AccountName];
        
        // Initialize Lable Credit Card
        self.creditCard = [[UILabel alloc] initWithFrame:CGRectMake(60.0, 20.0, 100.0, 40.0)];
        // Configure Label Temp
        [self.creditCard setBackgroundColor:[UIColor clearColor]];
        [self.creditCard setTextAlignment:NSTextAlignmentCenter];
        [self.creditCard setTextColor:[UIColor blueColor]];
        [self.creditCard setFont:[UIFont fontWithName:@"GillSans-Bold" size:16.0]];
        [self.creditCard setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin)];
        [self.contentView addSubview:self.creditCard];
        
        // Initialize Lable Credit Card
        self.accountAmount = [[UILabel alloc] initWithFrame:CGRectMake(60.0, 40.0, 100.0, 40.0)];
        // Configure Label Temp
        [self.accountAmount setBackgroundColor:[UIColor clearColor]];
        [self.accountAmount setTextAlignment:NSTextAlignmentCenter];
        [self.accountAmount setTextColor:[UIColor blueColor]];
        [self.accountAmount setFont:[UIFont fontWithName:@"GillSans-Bold" size:16.0]];
        [self.accountAmount setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin)];
        [self.contentView addSubview:self.accountAmount];
        
        
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
