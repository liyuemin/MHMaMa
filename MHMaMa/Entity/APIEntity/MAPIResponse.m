//
//  MAPIResponse.m
//  MaiMaiMai
//
//  Created by 李沛然 on 2016/10/21.
//  Copyright © 2016年 yuemin li. All rights reserved.
//

#import "MAPIResponse.h"

@implementation MAPIResponse

+ (instancetype)modelWithJSON:(id)json
{
    if (json == nil)
    {
        return nil;
    }
    MAPIResponse *responseModel = [MAPIResponse mj_objectWithKeyValues:json];
    return responseModel;
}

@end
