//
//  CustomGestureViewController.m
//  CustomGesture
//
//  Created by Andreas Katzian on 15.03.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomGestureViewController.h"
#import "CheckmarkGestureRecognizer.h"
#import "KeyPadViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"
#import "TransferViewController.h"


@implementation CustomGestureViewController
@synthesize amountField;
@synthesize amountParentView;
@synthesize animationImageView;
@synthesize verifyView;
@synthesize reset;
@synthesize timer;
@synthesize numericPadPopover;
@synthesize dropdownView;

- (void)dealloc
{
    [animationImageView release];
    [verifyView release];
    [reset release];
    [amountField release];
    [amountField release];
    [amountParentView release];
    [dropdownView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Create the custom checkmark gesture recognizer
    CheckmarkGestureRecognizer *recognizer = [[CheckmarkGestureRecognizer alloc] initWithTarget:self action:@selector(didRecognizeCheckmark:)];
    [self.verifyView addGestureRecognizer:recognizer];
    self.animationImageView.userInteractionEnabled = NO;
    [recognizer release];
    
    //self.verifyView.layer.borderWidth = 1.0f;
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openNumberPad:)];
    [self.amountParentView addGestureRecognizer:tapRecognizer];
    [tapRecognizer release];

    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clearField:) name:@"clearTarget" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(populateField:) name:@"doneTarget" object:nil];
}

- (void)clearField:(NSNotification *)notification{
    self.amountField.text = @"";
}

- (void)populateField:(NSNotification *)notification{
    NSString *number = (NSString *)[notification.userInfo objectForKey:@"numberEntered"];
    NSString *buttonTap = (NSString *)[notification.userInfo objectForKey:@"buttonTapped"];
    self.amountField.text = number;
    if([buttonTap isEqualToString:@"1"]){
        [self.numericPadPopover dismissPopoverAnimated:YES];
    }
}


-(void)didRecognizeCheckmark:(UIGestureRecognizer*)gestureRecognizer
{
    /*
    float c1 = (rand()%255)/255.0;
    float c2 = (rand()%255)/255.0;
    float c3 = (rand()%255)/255.0;
    NSLog(@"didRecognizeCheckmark %f", c1);
    
    //If a checkmark was recognized change the
    //background color of the view
    self.view.backgroundColor = [UIColor colorWithRed:c1 green:c2 blue:c3 alpha:1.0];
    */
    
    // Load images
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 1; i < 14; i++) {
        [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"check%i.png", i]]];
    }
    
    // Normal Animation
    //UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 95, 86, 193)];
    animationImageView.animationImages = images;
    animationImageView.animationDuration = 0.5;
    
    //[self.view addSubview:animationImageView];
    [animationImageView startAnimating];

    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(stopCheckMarkAnimation:) userInfo:nil repeats:NO];
    
}

- (NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscapeRight;
}
-(void)stopCheckMarkAnimation:(NSTimer*)theTimer{
    [animationImageView stopAnimating];
        animationImageView.image = [UIImage imageNamed:@"check13.png"];
    [self goBack:nil];
}


- (void)openNumberPad:(UIGestureRecognizer *)gestureRecognizer{
    if(!self.numericPadPopover){
        KeyPadViewController *number = [[KeyPadViewController alloc] init];
        UIPopoverController *numberController = [[UIPopoverController alloc] initWithContentViewController:number];
        [numberController setPopoverContentSize:CGSizeMake(315, 432)];
        self.numericPadPopover = numberController;
    }
    
    KeyPadViewController *keypadController = (KeyPadViewController *) self.numericPadPopover.contentViewController;
    keypadController.number = @"$";

    [self.numericPadPopover presentPopoverFromRect:self.amountParentView.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionRight animated:YES];
}

- (IBAction)showDropdown:(id)sender {
    CGRect amountPos = [self.amountParentView frame];
    [self.dropdownView setFrame: CGRectMake(amountPos.origin.x, amountPos.origin.y + amountPos.size.height, self.dropdownView.frame.size.width, self.dropdownView.frame.size.height)];
    [self.view addSubview:self.dropdownView];
}

- (IBAction)resetAction:(id)sender {
            animationImageView.image = [UIImage imageNamed:@"check1.png"];
}
- (IBAction)amountButtonTapped:(id)sender {
    UIView *view = (UIView *)sender;
    if(view.tag == 1){
        self.amountField.text = @"$1000.00";
    } else if(view.tag == 2){
        self.amountField.text = @"$25.00";
    } else {
        self.amountField.text = @"$5034.23";
    }
    [self.dropdownView removeFromSuperview];
}

- (IBAction)goBack:(id)sender {
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate.navController popToRootViewControllerAnimated:YES];
    TransferViewController *transferController = (TransferViewController *)[delegate.navController topViewController];
    transferController.successImage.hidden = NO;
    [transferController resetSelection];
}
@end
