//
//  CustomGestureViewController.h
//  CustomGesture
//
//  Created by Andreas Katzian on 15.03.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomGestureViewController : UIViewController {
    
}

-(void)didRecognizeCheckmark:(UIGestureRecognizer*)gestureRecognizer;
@property (retain, nonatomic) IBOutlet UIImageView *animationImageView;
@property (retain, nonatomic) IBOutlet UIView *verifyView;
@property (retain, nonatomic) IBOutlet UIButton *reset;
- (IBAction)openNumberPad:(id)sender;
@property (retain, nonatomic) IBOutlet UILabel *amountField;
@property (retain, nonatomic) IBOutlet UIView *amountParentView;
- (IBAction)showDropdown:(id)sender;

- (IBAction)resetAction:(id)sender;
@property (retain, nonatomic) NSTimer *timer;
@property (retain, nonatomic) UIPopoverController *numericPadPopover;
@property (retain, nonatomic) IBOutlet UIView *dropdownView;

- (IBAction)amountButtonTapped:(id)sender;

@end
