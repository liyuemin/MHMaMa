//
//  BaseViewController.h
//  MaiMaiMai
//
//  Created by yuemin li on 16/10/13.
//  Copyright © 2016年 yuemin li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MProgressHUDView.h"
#import "TRAlertToast.h"

@interface BaseViewController : UIViewController

@property (nonatomic, strong) MProgressHUDView *loadHUD;
@property (nonatomic, assign) BOOL haveBackBtn;
@property (nonatomic, assign) BOOL haveMyNavBar;
@property (nonatomic, assign) BOOL noMyNavBarBackBtn;
@property (nonatomic, strong) UINavigationBar *navBar;
@property (nonatomic, strong) UIColor * navBarColor;
@property (nonatomic, assign) BOOL lineBool;

- (void)setViewModelData;
- (void)setViewModelCallBack;
- (void)showAlertToast:(NSString *)alertString;
- (void)hideNavBar;
- (void)showNavBar;
- (void)setNavBarOverlayAlpha:(float)alphaF;
/**通过jsonString设置keyValue
 * @param keyValueJson 赋值Json
 */
 - (void)setKeyValueWithJson:(NSString *)keyValueJson;

- (NSArray *)propertyNameList;

- (void)goBack;
@end
