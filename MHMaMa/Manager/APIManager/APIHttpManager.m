//
//  APIHttpManager.m
//  MaiMaiMai
//
//  Created by yuemin li on 16/10/13.
//  Copyright © 2016年 yuemin li. All rights reserved.
//

#import "APIHttpManager.h"
#import "NSString+AFNetWorkAdditions.h"


@interface APIHttpManager()

@property (nonatomic ,strong)AFHTTPSessionManager *sessionManager;
@property (nonatomic ,strong)NSString *baseUrl;


@end


@implementation APIHttpManager

@synthesize sessionManager;
@synthesize baseUrl;


SYNTHESIZE_SINGLETON_FOR_CLASS(APIHttpManager);

- (id)init
{
    self = [super init];
    if (self)
    {
        self.sessionManager = [[AFHTTPSessionManager alloc] init];
        self.sessionManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    }
    return self;
}

- (instancetype)initWithSessionUrl:(NSString *)url
{
    self = [super init];
    if (self)
    {
        self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:url]];
    }
    return self;
}

- (instancetype)initWithBaseUrl:(NSString *)url
{
    self = [super init];
    if (self)
    {
        self.sessionManager = [[AFHTTPSessionManager alloc] init];
    }
    self.baseUrl = url;
    return self;
}

- (NSURLSessionDataTask *)requestTaskUrl:(NSString *)url Param:(NSDictionary *)param withExtroInfo:(NSDictionary *)back blockWithSuccess:(void(^)(NSDictionary * data ,NSDictionary *backSender))block failure:(void(^)(ApiError *error,NSDictionary *backSender))failure
{
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    return [self.sessionManager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"GET requesUrl is:%@ response is %@",url,responseObject);
        if ([responseObject isKindOfClass:[NSDictionary class]])
        {
            if(block)
            {
                block([NSDictionary dictionaryWithDictionary:responseObject],back);
            }
            else
            {
                if (failure)
                {
                    ApiError *error = [[ApiError alloc]init];
                    error.statusCode = MErrorTypeServerExcuteError;
                    failure(error,back);
                }
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"GET url%@ error is:%@",url,error);
        
        if (failure)
        {
            NSLog(@"error is:%@",error.userInfo);
            
            ApiError *tmpError = [[ApiError alloc]initWithDomain:error.domain code:error.code userInfo:error.userInfo];
            tmpError.statusCode = (long)((NSHTTPURLResponse *)task.response).statusCode;
            failure(tmpError,back);
        }
    }];
}

-(NSURLSessionDataTask *)postTaskUrl:(NSString *)url Param:(id)param withExtroInfo:(NSDictionary *)back SuceessBlock:(void(^)(NSDictionary *data ,NSDictionary *backSender))block failure:(void(^)(ApiError *error ,NSDictionary *backSender))failure
{
    
    self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    return [self.sessionManager POST:url parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]])
        {
            
           NSLog(@"POST requesUrl is:%@ response is %@",url,responseObject);
                if(block)
                {
                    NSLog(@"tmpMutdic is:%@",back);
                    
                    block([NSDictionary dictionaryWithDictionary:responseObject],back);
                    
                }
            
            else
            {
                if (failure)
                {
                    ApiError *error = [[ApiError alloc]init];
                    error.statusCode = MErrorTypeServerExcuteError;
                    failure(error,back);
                }
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"RESTAPI:Fail:%@",error.description);
        if (failure)
        {
            ApiError *tmpError = [[ApiError alloc]initWithDomain:error.domain code:error.code userInfo:error.userInfo];
            tmpError.statusCode = (long)((NSHTTPURLResponse *)task.response).statusCode;
            failure(tmpError,back);
        }
    }];
}

-(NSURLSessionDataTask *)productGET:(NSString *)interfacePath
                            success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                            failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    AFHTTPSessionManager *httpSessionManager =[AFHTTPSessionManager manager];
    httpSessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
    [httpSessionManager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    NSString *key = interfacePath;
    NSString *date = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    if(date != nil && ![date isEqualToString:@""])
    {
        [httpSessionManager.requestSerializer setValue:date forHTTPHeaderField:@"If-Modified-Since"];
    }
    NSString *path = [NSString stringWithFormat:@"%@",interfacePath];
    path =  [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [httpSessionManager GET:path parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
    
    return nil;
}

@end

