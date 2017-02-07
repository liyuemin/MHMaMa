//
//  CodeConfig.h
//  MaiMaiMai
//
//  Created by 李沛然 on 2016/11/14.
//  Copyright © 2016年 李沛然. All rights reserved.
//

#ifndef CodeConfig_h
#define CodeConfig_h

#pragma mark - 警告框
/*警告框*/

#define ALERT_MSG(title,msg)\
{\
UIAlertView *_alert=[[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:NSLocalizedString(@"确定", nil) otherButtonTitles:nil]; \
_alert.transform=CGAffineTransformMakeTranslation(0, 80); \
[_alert show]; \
}

#pragma mark - NSUserDefaults
/*NSUserDefaults*/
#define KUserdefaults           [NSUserDefaults standardUserDefaults]
#pragma mark - 判断app是第一次安装还是更新升级
/*判断app是第一次安装还是更新升级*/
#define IsShowFeatureGuide  [KUserdefaults boolForKey:@"isShowFeatureGuide"]
#pragma mark - 判断空
/*判断空*/
#define kisNilString(__String) (__String==nil || __String == (id)[NSNull null] || ![__String isKindOfClass:[NSString class]] || [__String isEqualToString:@""] || [[__String stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""])

#pragma mark - Proj字体
/*Proj字体*/
#define SYS_FONT(x) [UIFont systemFontOfSize:x]
#define SYS_BOLDFONT(x) [UIFont boldSystemFontOfSize:x]

#pragma mark - 计算字符串长度
/*计算字符串长度*/
#define MB_TEXTSIZE(text, font) [text length] > 0 ? [text \
sizeWithAttributes:@{NSFontAttributeName:font}] : CGSizeZero;

#pragma mark - 计算字符串Size
/*计算字符串Size*/
#define MB_MULTILINE_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text \
boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) \
attributes:@{NSFontAttributeName:font} context:nil].size : CGSizeZero;

#pragma mark - 设置颜色
/*设置颜色*/
#define RGBA16(RGB,A) [UIColor color16WithHexString:RGB alpha:A]
#define RGBA(R, G, B, A) [UIColor colorWithRed:R / 255.0 green:G / 255.0 blue:B / 255.0 alpha:A]

#pragma mark - 单例
/*单例*/
#define SYNTHESIZE_SINGLETON_FOR_CLASS(classname)   \
\
+ (classname *)shared##classname\
{\
static classname *shared##classname = nil;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
shared##classname = [[classname alloc] init];\
});\
return shared##classname;\
}

#pragma mark - Debug & Release
/*Debug & Release*/
#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) {}
#endif

#endif /* CodeConfig_h */
