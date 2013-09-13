//
//  KeyPadViewController.m
//  CustomGesture
//
//  Created by Wang, Jinlian on 9/13/13.
//
//

#import "KeyPadViewController.h"

@interface KeyPadViewController ()

@end

@implementation KeyPadViewController
@synthesize number;

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
    self.number = @"$";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)numberButtonTap:(id)sender {
    UIView *view = (UIView *)sender;
    self.number = [NSString stringWithFormat:@"%@%i", self.number, view.tag];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"doneTarget" object:nil userInfo:[NSDictionary dictionaryWithObject:self.number forKey:@"numberEntered"]];
}

- (IBAction)dotButtonTap:(id)sender {
    self.number = [NSString stringWithFormat:@"%@.", self.number];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"doneTarget" object:nil userInfo:[NSDictionary dictionaryWithObject:self.number forKey:@"numberEntered"]];
}

- (IBAction)clearButtonTap:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"clearTarget" object:nil userInfo:nil];
}

- (IBAction)doneButtonTap:(id)sender {
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:self.number, @"1", nil] forKeys:[NSArray arrayWithObjects:@"numberEntered", @"buttonTapped", nil]];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"doneTarget" object:nil userInfo:userInfo];
}
@end
