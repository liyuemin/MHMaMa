//
//  APIHttpManager.h
//  MaiMaiMai
//
//  Created by yuemin li on 16/10/13.
//  Copyright © 2016年 yuemin li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "ApiError.h"

@interface APIHttpManager : NSObject

+ (APIHttpManager *)sharedAPIHttpManager;

- (instancetype)initWithSessionUrl:(NSString *)url;

- (instancetype)initWithBaseUrl:(NSString *)url;

//Get
- (NSURLSessionDataTask *)requestTaskUrl:(NSString *)url Param:(NSDictionary *)param withExtroInfo:(NSDictionary *)back blockWithSuccess:(void(^)(NSDictionary * data ,NSDictionary *backSender))block failure:(void(^)(ApiError *error,NSDictionary *backSender))failure;

//Post
-(NSURLSessionDataTask *)postTaskUrl:(NSString *)url Param:(id)param withExtroInfo:(NSDictionary *)back SuceessBlock:(void(^)(NSDictionary *data ,NSDictionary *backSender))block failure:(void(^)(ApiError *error ,NSDictionary *backSender))failure;

//下载文件
-(NSURLSessionDataTask *)productGET:(NSString *)interfacePath
                            success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                            failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end
