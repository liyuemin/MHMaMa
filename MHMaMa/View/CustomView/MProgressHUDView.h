//
//  MProgressHUDView.h
//  MaiMaiMai
//
//  Created by 李沛然 on 2016/10/21.
//  Copyright © 2016年 yuemin li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MProgressHUDView : UIView

- (void)show:(BOOL)animated;
- (void)hide:(BOOL)animated;
- (void)hide:(BOOL)animated afterDelay:(NSTimeInterval)delay;

@end
