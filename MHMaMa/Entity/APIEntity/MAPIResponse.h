//
//  MAPIResponse.h
//  MaiMaiMai
//
//  Created by 李沛然 on 2016/10/21.
//  Copyright © 2016年 yuemin li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface MAPIResponse : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, strong) NSDictionary *data;

+ (instancetype)modelWithJSON:(id)json;

@end
