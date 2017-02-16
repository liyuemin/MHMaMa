//
//  NSString+Valid.h
//  MaiMaiMai
//
//  Created by 李沛然 on 2016/10/19.
//  Copyright © 2016年 yuemin li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Valid)

- (BOOL)isValidPhone;

- (BOOL)isValidIdentifyCode;
- (BOOL)isNeedUpdate:(NSString *)onlineVersion;

- (BOOL)isValidNickName;

@end
