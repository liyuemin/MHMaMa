//
//  TRAlertToast.h
//  TRGatherLove
//
//  Created by 李沛然 on 16/6/12.
//  Copyright © 2016年 liyuemin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MStatusBarType)
{
    MStatusBarTypeCmt,//发表评论
};//状态栏-模式

@interface TRAlertToast : UIView

+ (void)showAlertToastOnStatusBar:(MStatusBarType)statusBarType entityName:(NSString *)entityName WithString:(NSString *)toastString withTargetDic:(NSDictionary *)paramDic;

- (void)setShowText:(NSString *)tmpText;

/************************
 *  tmpSuperView:该toast要弹出的父View
 *  tmpHidden:是否自动消失
 *  cancelBool:弹出该toast，父View是否有排他性
 ************************/
- (void)showInView:(UIView *)tmpSuperView WithHidden:(BOOL)tmpHidden withCancelOtherBool:(BOOL)cancelBool;

- (void)setMyOrigin:(float)tmpOrigin;

- (void)hidden;

@end
