//
//  AccountCell.m
//  transferHack
//
//  Created by Johnson, John (CONT) on 9/13/13.
//  Copyright (c) 2013 Capital One. All rights reserved.
//

#import "AccountCell.h"
#import <QuartzCore/QuartzCore.h>

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
        self.AccountName = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 180, 40.0)];
        [self.AccountName setBackgroundColor:[UIColor clearColor]];
        
        [self.AccountName setTextColor:[UIColor colorWithRed:0.0/255.0 green:58.0/255.0 blue:111.0/255.0 alpha:1.0]];
        //Trade Goth Bold
        
        [self.AccountName setFont:[UIFont fontWithName:@"Helvetica" size:20.0]];
        [self.AccountName setAutoresizingMask:(UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin)];
        [self.contentView addSubview:self.AccountName];
        
        // Initialize Lable Credit Card
        self.creditCard = [[UILabel alloc] initWithFrame:CGRectMake(5, 40, 80.0, 40.0)];
        // Configure Label Temp
        [self.creditCard setBackgroundColor:[UIColor clearColor]];
        [self.creditCard setTextAlignment:NSTextAlignmentCenter];
        [self.creditCard setTextColor:[UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0]];
        
        [self.creditCard setFont:[UIFont fontWithName:@"Helvatica" size:15.0]];
        [self.creditCard setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin)];
        [self.contentView addSubview:self.creditCard];
        
        //Helvatica Regular
        //RGB 51, 51, 51
        
        
        // Initialize Lable Credit Card
        self.accountAmount = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 160, 40.0)];
        // Configure Label Temp
        [self.accountAmount setBackgroundColor:[UIColor clearColor]];
        [self.accountAmount setTextAlignment:NSTextAlignmentCenter];
       
        [self.accountAmount setTextColor:[UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0]];
        [self.accountAmount setFont:[UIFont fontWithName:@"Helvetica" size:38.0]];
        [self.accountAmount setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin)];
        [self.contentView addSubview:self.accountAmount];
        
        
        //Helvatica Regular
        //RGB 51,51,51
        

      // Background View
       UIImage *backgroundImage = [[UIImage imageNamed:@"account-bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(20.0, 20.0, 20.0, 20.0)];
       UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, size.width, size.height)];
        [backgroundView setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
       [backgroundView setImage:backgroundImage];
        [self setBackgroundView:backgroundView];
    
    }
    return self;
}
@end
