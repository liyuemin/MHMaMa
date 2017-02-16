//
//  NSString+Valid.m
//  MaiMaiMai
//
//  Created by 李沛然 on 2016/10/19.
//  Copyright © 2016年 yuemin li. All rights reserved.
//

#import "NSString+Valid.h"

@implementation NSString (Valid)

- (BOOL)isValidPhone
{
    NSString * ORIGINMOBILE = @"^1\\d{10}$";
    
    NSPredicate *regextestoriginmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", ORIGINMOBILE];
    BOOL result = [regextestoriginmobile evaluateWithObject:self];
    NSLog(@"mobile:%d",result);
    return result;
}

- (BOOL)isValidIdentifyCode
{
    NSString *regex = @"(^[0-9]{4,6}$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL result = [pred evaluateWithObject:self];
    NSLog(@"identifyCode:%d",result);
    return result;
}

- (BOOL)isNeedUpdate:(NSString *)onlineVersion
{
    NSArray *myArray = [self componentsSeparatedByString:@"."];
    NSArray *onlineArray = [onlineVersion componentsSeparatedByString:@"."];
    
    if (myArray.count == 3 && onlineArray.count == 3)
    {
        __block BOOL needUpdate = NO;
        [myArray enumerateObjectsUsingBlock:^(NSString *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *tmpOnlineSubString = [onlineArray objectAtIndex:idx];
            if (obj.integerValue < tmpOnlineSubString.integerValue)
            {
                needUpdate = YES;
                *stop = YES;
            }
        }];
        return needUpdate;
    }
    return NO;
}

- (BOOL)isValidNickName
{
    if (!self)
    {
        return NO;
    }
    NSString *tmpString = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    return tmpString.length <=15 && tmpString.length >=2;
}

@end
