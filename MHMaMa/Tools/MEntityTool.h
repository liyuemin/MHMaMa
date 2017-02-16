//
//  MEntityTool.h
//  MaiMaiMai
//
//  Created by 李沛然 on 2016/10/21.
//  Copyright © 2016年 yuemin li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MEntityTool : NSObject

// 将JSON串转化为字典或者数组
+ (id)toArrayOrNSDictionary:(NSString *)jsonString;

// 字典数组转字符串
+ (NSString*)dictOrArrayJSONString:(id)sender;

@end
