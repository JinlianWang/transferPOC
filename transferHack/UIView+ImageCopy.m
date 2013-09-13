//
//  UIView+ImageCopy.m
//  transferHack
//
//  Created by Jimmy on 9/13/13.
//  Copyright (c) 2013 Capital One. All rights reserved.
//

#import "UIView+ImageCopy.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (ImageCopy)
-(UIImage *)cofImageContents
{
    CGSize mySize = self.bounds.size;
    UIGraphicsBeginImageContext(mySize);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
