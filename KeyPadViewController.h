//
//  KeyPadViewController.h
//  CustomGesture
//
//  Created by Wang, Jinlian on 9/13/13.
//
//

#import <UIKit/UIKit.h>

@interface KeyPadViewController : UIViewController{
    
}
- (IBAction)numberButtonTap:(id)sender;
- (IBAction)dotButtonTap:(id)sender;
- (IBAction)clearButtonTap:(id)sender;
- (IBAction)doneButtonTap:(id)sender;

@property (retain, nonatomic) NSString *number;
@end
