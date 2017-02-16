//
//  MEntityTool.m
//  MaiMaiMai
//
//  Created by 李沛然 on 2016/10/21.
//  Copyright © 2016年 yuemin li. All rights reserved.
//

#import "MEntityTool.h"

@implementation MEntityTool

// 将JSON串转化为字典或者数组
+ (id)toArrayOrNSDictionary:(NSString *)jsonString
{
    if (!jsonString)
    {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                    options:NSJSONReadingAllowFragments
                                                      error:&error];
    
    if (jsonObject != nil && error == nil)
    {
        return jsonObject;
    }
    else
    {
        // 解析错误
        return nil;
    }
}

// 字典数组转字符串
+ (NSString*)dictOrArrayJSONString:(id)sender
{
    if (!sender)
    {
        return nil;
    }
    NSError* error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:sender
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if ([jsonData length] > 0 && error == nil)
    {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                     encoding:NSUTF8StringEncoding];
        return jsonString;
    }
    else
    {
        return nil;
    }
}

@end
