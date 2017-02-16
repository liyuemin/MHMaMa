//
//  APIUrlManager.m
//  MaiMaiMai
//
//  Created by yuemin li on 16/10/13.
//  Copyright © 2016年 yuemin li. All rights reserved.
//

#import "APIUrlManager.h"





/*----------------------------------------------------------------------------- */
NSString * const API_Back_URLParam = @"API_Back_URLParam";
NSString * const API_Back_ExtroInfo = @"API_Back_ExtroInfo";
NSString * const API_Back_CachMd5 = @"API_Back_CachMd5";
NSString * const API_Back_NotNet = @"API_Back_NotNet";
NSString * const API_Back_URLCode = @"API_Back_URLCode";
NSString * const API_PostUserInfo_Code = @"API_PostUserInfo_Code";  //有业务逻辑传入统计数据放在请求参数里面
/*----------------------------------------------------------------------------- */

#pragma mark - H5 URL
NSString * const API_H5_HowSupply = @"/app/uploadintro";
NSString * const API_H5_RegisterCategory = @"/app/regpact";
NSString * const API_H5_GoodDetailShare = @"/i/";
NSString * const API_H5_GoodDetail = @"/pic/";
NSString * const API_H5_DownloadGuide = @"/app";
NSString * const API_H5_AboutUs = @"/about";

/*----------------------------------------------------------------------------- */
/*----------------------------------------------------------------------------- */
NSString *const API_get_topic_Code = @"/V2/Index/get_topic";
NSString *const API_hot_ctg_Code = @"/V2/Index/hot_ctg";
NSString * const API_hotRecom_Code = @"/V2/Index/top";
NSString * const API_Is_Bored_Code = @"/V2/Index/is_bored";
NSString * const API_TeJia_Code = @"/V2/Index/tejia";



/*----------------------------------------------------------------------------- */



#pragma mark - 首页，搜索，详情 URL
NSString *const API_hotCtg_Code = @"/V1/Index/hot_ctg";
NSString *const  API_RecommendProductWord_Code = @"/Index/recommend";

NSString *const API_HotProductsWord_Code = @"/Index/get_recommend";

NSString *const  API_HotSearchWord_Code = @"/V1/Index/hot_keyword";

NSString *const API_SearchSuggestsWord_Code = @"/V1/Index/suggest";

NSString *const API_SearchProducWord_Code = @"/V2/Search/s";

NSString *const API_SearchBrandWord_Code = @"/Search/get_search_brand";

NSString * const API_ProductDetailsWord_Code = @"";
NSString * const API_BrandDetailsWord_Code = @"/Search/get_brand_info";


NSString * const API_APPVersion_Code = @"/V1/Setting/version";

NSString * const API_IsAppendProduct_Code = @"/V1/Detail/get_replys_freq";

/*----------------------------------------------------------------------------- */
#pragma mark-- 我
NSString * const API_ProductComment_Code = @"/V2/User/comments";
NSString * const API_Del_ProductComment_Code = @"/V2/User/del_comments";
NSString * const API_Read_Message_Code = @"/V2/User/read_message";
NSString * const API_Del_Message_Code = @"/V2/User/del_message";
NSString * const API_My_Message_Code = @"/V2/User/message";

/*----------------------------------------------------------------------------- */
#pragma mark-- 详情页接口

NSString *const API_ProductCommentDitails_Code = @"/V2/Detail/view";

NSString * const API_ProductCommentTags_Code = @"/Detail/get_tags";

NSString * const API_ProductComments_Code = @"/V2/Detail/get_replys";

NSString * const API_ProductDetailBrandInfo_Code = @"/V1/Detail/get_brand_info";

NSString * const API_ProductCollection_Code = @"/V2/User/add_collection";
NSString * const API_ProductMoreMall_Code = @"/V2/Detail/get_mall";
NSString * const API_Comments_Ditails_Code = @"/V2/Thread/Info";

NSString * const API_Comment_Helpful_Code = @"/V2/Detail/helpful";

NSString * const API_Comment_Delete_Code = @"/V2/Thread/del";
NSString * const API_Comment_ThreadAdd_Code = @"/V2/Thread/add";
NSString * const API_Comment_ThreadReply_Code = @"/V2/Thread/reply";
/*----------------------------------------------------------------------------- */
#pragma mark - 登录，注册，评论，分类, 设置 URL
NSString *const API_Login_Code = @"/V2/User/login";

NSString *const API_IdentifyCode_Code = @"/V1/User/sms";

NSString *const API_SendComment_Code = @"/V1/Detail/replys";

NSString *const API_GetToken_Code = @"/V1/Detail/get_upload_token";

NSString *const API_GetCategory_Code = @"/V1/Index/all_ctg";

NSString *const API_SendAPSClientId_Code = @"/V1/User/bind_push";

NSString *const API_FavoriteProduct_Code = @"/V2/User/collection";

NSString *const API_ModifyUserInfo_Code = @"/V2/User/perfect";

NSString *const API_del_collection_Code = @"/V2/User/del_collection";

NSString *const API_ModifyNotification_Code = @"/V2/Setting/push_lock";

NSString *const API_GetUserInfo_Code = @"/V2/User/info";

NSString *const API_RefreshToken_Code = @"/V2/User/refresh_user_token";

NSString *const API_GetTips_Code = @"/V2/Setting/get_tips_num";

/*----------------------------------------------------------------------------- */
NSString *const API_MaiLog_Code = @"/V2/Detail/log";


#define SIGN_KEY   @"Gg=z?p!6bqu^#xk$:4L1sA~Vd7)Za_iw/PeYM}]T"   // 0cb49b9d3257ffa0  调试签名


@implementation APIUrlManager


+ (NSString *)getdefaultUrl:(NSDictionary *)backDic
{
    return [backDic objectForKey:API_Back_URLParam];
}



+ (NSString *)getParamUrlSring:(NSDictionary *)param {
    NSMutableString *sign = [[NSMutableString alloc] init];
    NSArray *keys = [[param allKeys] sortedArrayWithOptions:NSSortStable usingComparator:^(id objOne , id objTwo)
                     {
                         return[objOne compare:objTwo];
                     }];
    for(int i = 0 ; i < keys.count ; i++){
        NSString *key = [keys objectAtIndex:i];
        if(i == 0){
            [sign appendFormat:@"%@=%@",key,[param valueForKey:key]];
        }else{
            [sign appendFormat:@"&%@=%@",key,[param valueForKey:key]];
        }
    }
    NSLog(@"sign is:%@",sign);
    return sign;
}

+ (NSString *)getURLSign:(NSString *)url{
    NSLog(@"%@",[NSString stringWithFormat:@"%@%@%@",SIGN_KEY,url,SIGN_KEY]);
    return [[NSString stringWithFormat:@"%@%@%@",SIGN_KEY,url,SIGN_KEY] md5];
}

+(NSString *)getHttpRequestUrl:(NSString *)url defaultUrl:(NSDictionary *)defauls Param:(NSDictionary *)param {
    NSString *paramUrl = [APIUrlManager getParamUrlSring:param];
    NSString *sign = [APIUrlManager getURLSign:paramUrl];
    
    NSString * urlTmp = [NSString stringWithFormat:@"%@%@%@&sign=%@",API_Base, [APIUrlManager getdefaultUrl:defauls],paramUrl, sign];
    
    return urlTmp;
}

+ (NSDictionary *)getHeaderInfo
{
    return nil;
}

/**
 *  截取URL中的参数
 *
 *  @return NSMutableDictionary parameters
 */
+ (NSMutableDictionary *)getURLParameters:(NSString *)urlStr
{
    // 查找参数
    NSRange range = [urlStr rangeOfString:@"?"];
    if (range.location == NSNotFound) {
        return nil;
    }
    
    // 以字典形式将参数返回
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    // 截取参数
    NSString *parametersString = [urlStr substringFromIndex:range.location + 1];
    
    // 判断参数是单个参数还是多个参数
    if ([parametersString containsString:@"&"]) {
        
        // 多个参数，分割参数
        NSArray *urlComponents = [parametersString componentsSeparatedByString:@"&"];
        
        for (NSString *keyValuePair in urlComponents) {
            // 生成Key/Value
            NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
            NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
            NSString *value = [pairComponents.lastObject stringByRemovingPercentEncoding];
            
            // Key不能为nil
            if (key == nil || value == nil) {
                continue;
            }
            
            id existValue = [params valueForKey:key];
            
            if (existValue != nil) {
                
                // 已存在的值，生成数组
                if ([existValue isKindOfClass:[NSArray class]]) {
                    // 已存在的值生成数组
                    NSMutableArray *items = [NSMutableArray arrayWithArray:existValue];
                    [items addObject:value];
                    
                    [params setValue:items forKey:key];
                } else {
                    
                    // 非数组
                    [params setValue:@[existValue, value] forKey:key];
                }
                
            } else {
                
                // 设置值
                [params setValue:value forKey:key];
            }
        }
    } else {
        // 单个参数
        
        // 生成Key/Value
        NSArray *pairComponents = [parametersString componentsSeparatedByString:@"="];
        
        // 只有一个参数，没有值
        if (pairComponents.count == 1) {
            return nil;
        }
        
        // 分隔值
        NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
        NSString *value = [pairComponents.lastObject stringByRemovingPercentEncoding];
        
        // Key不能为nil
        if (key == nil || value == nil) {
            return nil;
        }
        
        // 设置值
        [params setValue:value forKey:key];
    }
    
    return params;
}
@end
