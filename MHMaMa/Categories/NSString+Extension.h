
//
//  ViewController.h
//  RACTestOC
//
//  Created by mai on 16/9/26.
//  Copyright © 2016年 mai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIButton+YYWebImage.h"

@interface NSString (Extension)

- (CGSize)sizeWithFont:(UIFont *)font;

- (CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

- (BOOL)finderFromMemoryUrl;
@end
