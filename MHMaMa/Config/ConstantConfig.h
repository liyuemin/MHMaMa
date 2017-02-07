//
//  ConstantConfig.h
//  MaiMaiMai
//
//  Created by 李沛然 on 2016/11/14.
//  Copyright © 2016年 李沛然. All rights reserved.
//

#ifndef ConstantConfig_h
#define ConstantConfig_h

//发布到AppStore打开
//#define Distribution


//每次版本更新的时候需要产品确认，该版本的引导页是否和上一个版本一致，如果一致，版本号保持不变，如果不一致，那就和改成当前info 里的版本号。
//如果老用户升级，且确定和老版本的引导页一致，不现实，如果老用户升级和老版本不一致，就显示。
#define kFeatureProductGuideVersion  @"2.0.1"
#define kFeatureCommentGuideVersion  @"2.0.1"
#define kFeatureHomeGuideVersion  @"2.1.0"

#pragma mark - 系统版本
/*系统版本*/
#ifndef SystemVersion
#define SystemVersion [UIDevice currentDevice].systemVersion.doubleValue
#endif
#ifndef iOS6Later
#define iOS6Later (SystemVersion >= 6)
#endif
#ifndef iOS7Later
#define iOS7Later (SystemVersion >= 7)
#endif
#ifndef iOS8Later
#define iOS8Later (SystemVersion >= 8)
#endif
#ifndef iOS9Later
#define iOS9Later (SystemVersion >= 9)
#endif

#pragma mark - 屏幕size
/*屏幕size*/
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#pragma mark - NotificationName
/*NotificationName*/
#define MSearchViewnNotification @"MSearchViewCilckNotification"
#define MAddSuggestsNotification @"MAddSuggestsNotification"
#define MUploadTokenNotification @"MUploadTokenNotification"

#pragma mark - EdgeInsets
/*EdgeInsets*/
#define TOPBAR_BACKEDGE                         UIEdgeInsetsMake(0, -5, 0, 5)
#define TOPBAR_RIGHTEDGE                         UIEdgeInsetsMake(0, 10, 0, -10)

#pragma mark - Proj颜色
/*Proj颜色*/
#define Sys_Blue [UIColor color16WithHexString:@"#5c75cc" alpha:1]
#define Sys_Nav_Bar_Color k_F58262//[UIColor color16WithHexString:@"#f7f7f7" alpha:1]
#define Sys_Nav_Title_Color [UIColor whiteColor]//[UIColor color16WithHexString:@"#3a3a3a" alpha:1]


/* ------------------------------- 标准颜色 在这里添加 ----------------------------------------*/
#define k_101010 [UIColor color16WithHexString:@"#101010" alpha:1]
#define k_3A3A3A [UIColor color16WithHexString:@"#3a3a3a" alpha:1]

#define k_5681F6 [UIColor color16WithHexString:@"#5681F6" alpha:1]
#define k_FDFDFD [UIColor color16WithHexString:@"#FDFDFD" alpha:1]
#define k_F2F2F2 [UIColor color16WithHexString:@"#F2F2F2" alpha:1]
#define k_DCDCDC [UIColor color16WithHexString:@"#DCDCDC" alpha:1]
#define k_F5F5F5 [UIColor color16WithHexString:@"#F5F5F5" alpha:1]
#define k_757575 [UIColor color16WithHexString:@"#757575" alpha:1]
#define k_F0F0F0 [UIColor color16WithHexString:@"#F0F0F0" alpha:1]
#define k_C2C8DC [UIColor color16WithHexString:@"#C2C8DC" alpha:1]
#define k_F7805F [UIColor color16WithHexString:@"#F7805F" alpha:1]
#define k_CCCCCC [UIColor color16WithHexString:@"#CCCCCC" alpha:1]
#define k_999999 [UIColor color16WithHexString:@"#999999" alpha:1]
#define k_E5E5E5 [UIColor color16WithHexString:@"#E5E5E5" alpha:1]
#define k_B7A6A2 [UIColor color16WithHexString:@"#B7A6A2" alpha:1]


#define k_000000 [UIColor color16WithHexString:@"#000000" alpha:1]
#define k_FFFFFF [UIColor color16WithHexString:@"#FFFFFF" alpha:1]
#define k_2A2A2A [UIColor color16WithHexString:@"#2A2A2A" alpha:1]
#define k_3C3C3C [UIColor color16WithHexString:@"#3C3C3C" alpha:1]
#define k_666666 [UIColor color16WithHexString:@"#666666" alpha:1]
#define k_B5B5B5 [UIColor color16WithHexString:@"#B5B5B5" alpha:1]
#define k_E5E5E5 [UIColor color16WithHexString:@"#E5E5E5" alpha:1]
#define k_F4F4F4 [UIColor color16WithHexString:@"#F4F4F4" alpha:1]
#define k_F58262 [UIColor color16WithHexString:@"#F58262" alpha:1]
#define k_573528 [UIColor color16WithHexString:@"#573528" alpha:0.9]
#define k_FFBC4D [UIColor color16WithHexString:@"#FFBC4D" alpha:1]
#define k_FB4747 [UIColor color16WithHexString:@"#FB4747" alpha:1]
#define k_FAFAFA [UIColor color16WithHexString:@"#FAFAFA" alpha:1]
#define k_FD4747 [UIColor color16WithHexString:@"#FD4747" alpha:1]
#define k_D5D5D5 [UIColor color16WithHexString:@"#D5D5D5" alpha:1]
/* ----------------------------------- 标准颜色 在这里添加 -----------------------------------------*/

#pragma mark - 第三方Key

#ifdef Distribution
    /*网络BaseUrl*/
    #define API_H5Url @"http://koubei.maimaimai.com"
    #define API_Base @"https://apis.maimaimai.com"
    /*阿里百川feedback AppKey*/
    #define AliBaiChuan_FeedBackAppKey @"23495277"
    #define AliBaiChuan_FeedBackAppSecret @"54d23e16b4c1a63ed48c2195018c520d"
    #define AliBaiChuan_mmPid @"mm_24440483_0_0"
    /*京东开普勒*/
    #define JDValue_AppKey @"a0f09a74820b4c8a8adecd978b6bd459"
    #define JDValue_AppSecret @"fff1fbb28c4145e0a1550768f784a3ce"
    /*UMeng AppKey*/
    #define YOUMENG_APPKEY @"58130a918f4a9d30610004e9"
    /*UMeng Channel*/
    #define UMENG_CHANNEL @"AppStore"
    /*QQ*/
    #define QQ_APPID @"1103475638"
    /*微信*/
    #define WECHAT_APPID @"wxf68249fb4111fed7"
    #define WECHAT_APPSECRET @"20333cb5beb978b14fc430211c0230da"
    /*微博*/
    #define WEIBO_APPKEY @"1955626936"
    #define WEIBO_APPSECRET @"84d45c5beec237fccbf0dee8342211fd"
    /*支付宝*/
    #define ALIPAY_APPKEY @"58130a918f4a9d30610004e9"
    /*AppStore*/
    #define APPSTORE_APPID @"954980605"
    /*个推开发者网站中申请App时，注册的AppId、AppKey、AppSecret*/
    #define kGtAppId           @"Ob4349nXWx6azQd3GUniY3"
    #define kGtAppKey          @"g251gDoE8r8Fn8fB1mmcU3"
    #define kGtAppSecret       @"ohsF2Mnfxk8LqE8NuPi9N6"
#else
    /*网络BaseUrl*/
    #define API_H5Url @"http://koubei.maimaimai.com"
    #define API_Base @"https://api.maimaimai.com"
    /*阿里百川feedback AppKey*/
    #define AliBaiChuan_FeedBackAppKey @"23495277"
    #define AliBaiChuan_FeedBackAppSecret @"54d23e16b4c1a63ed48c2195018c520d"
    #define AliBaiChuan_mmPid @"mm_24440483_0_0"
    /*京东开普勒*/
    #define JDValue_AppKey @"a0f09a74820b4c8a8adecd978b6bd459"
    #define JDValue_AppSecret @"fff1fbb28c4145e0a1550768f784a3ce"
    /*UMeng AppKey*/
    #define YOUMENG_APPKEY @"58228d7ac62dca54a5004233"  
    /*UMeng Channel*/
    #define UMENG_CHANNEL @"AppStore"
    /*QQ*/
    #define QQ_APPID @"1103475638"
    /*微信*/
    #define WECHAT_APPID @"wxf68249fb4111fed7"
    #define WECHAT_APPSECRET @"20333cb5beb978b14fc430211c0230da"
    /*微博*/
    #define WEIBO_APPKEY @"1955626936"
    #define WEIBO_APPSECRET @"84d45c5beec237fccbf0dee8342211fd"
    /*支付宝*/
    #define ALIPAY_APPKEY @"58130a918f4a9d30610004e9"
    /*AppStore*/
    #define APPSTORE_APPID @"954980605"
    /*个推开发者网站中申请App时，注册的AppId、AppKey、AppSecret*/
    #define kGtAppId           @"ncgwNX8z7w9bPoBzUBKjh9"
    #define kGtAppKey          @"I515tXmtbG6G93031YGDQ4"
    #define kGtAppSecret       @"0g1rSeuZOz652ZUrsmwg28"

#endif

#pragma mark - Local Config Cache
/*Local Config Cache*/
#define Config_Cache_Folder @"ConfigCache"

#pragma mark - APPStore Link
/**/
#define APPStore_Link @"https://itunes.apple.com/us/app/mai-mai-mai-zhuan-ye-dao-gou-ban/id954980605?mt=8"

#pragma mark - IOS today widget
//widget top横向按钮
#define WidgetHeader @"Header:"
//widget list纵向cell
#define WidgetCells @"Cells:"

#pragma mark - FeedBackQQ
#define FeedBackQQ @"377582722"




#endif /* ConstantConfig_h */
