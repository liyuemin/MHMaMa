//
//  APIUrlManager.h
//  MaiMaiMai
//
//  Created by yuemin li on 16/10/13.
//  Copyright © 2016年 yuemin li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+AFNetWorkAdditions.h"

#pragma API 基本参数

/*----------------------------------------------------------------------------- */

extern NSString * const API_Back_URLParam;
extern NSString * const API_Back_ExtroInfo;
extern NSString * const API_Back_CachMd5;
extern NSString * const API_Back_NotNet;

extern NSString * const API_Back_URLCode;
extern NSString * const API_PostUserInfo_Code;
/*----------------------------------------------------------------------------- */

extern NSString * const API_H5_HowSupply;
extern NSString * const API_H5_RegisterCategory;
extern NSString * const API_H5_GoodDetailShare;
extern NSString * const API_H5_GoodDetail;
extern NSString * const API_H5_DownloadGuide;
extern NSString * const API_H5_AboutUs;


/*----------------------------------------------------------------------------- */
extern NSString * const API_get_topic_Code;
extern NSString * const API_hot_ctg_Code;
extern NSString * const API_hotRecom_Code;
extern NSString * const API_Is_Bored_Code;

/*----------------------------------------------------------------------------- */


#pragma ------API 定义
/*----------------------------------------------------------------------------- */
//热门分类
extern NSString *const  API_hotCtg_Code;
//热搜词
extern NSString *const  API_HotSearchWord_Code;
////热门产品
extern NSString *const  API_HotProductsWord_Code;
//推荐
extern NSString *const  API_RecommendProductWord_Code;
//搜索建议词
extern NSString *const  API_SearchSuggestsWord_Code;
//搜索
extern NSString * const API_SearchProducWord_Code;
//搜索品牌下拉列表
extern NSString * const API_SearchBrandWord_Code;

extern NSString * const API_ProductComments_Code ;
extern NSString * const API_APPVersion_Code;

extern NSString * const API_ProductComment_Code;

extern NSString * const API_del_collection_Code;
extern NSString * const API_Read_Message_Code;
extern NSString * const API_Del_Message_Code;
extern NSString * const API_My_Message_Code;
extern NSString * const API_Del_ProductComment_Code;
extern NSString * const API_TeJia_Code;
/*----------------------------------------------------------------------------- */

//品牌详情
extern NSString * const API_BrandDetailsWord_Code;
//产品详情
extern NSString * const API_ProductDetailsWord_Code;
//获取评论商品简介接口
extern NSString * const API_ProductCommentDitails_Code;

extern NSString * const API_ProductDetailBrandInfo_Code;
//获取是否追评
extern NSString * const API_IsAppendProduct_Code;
extern NSString * const API_ProductCommentTags_Code ;

//商品收藏
extern NSString * const API_ProductCollection_Code;

extern NSString * const API_ProductMoreMall_Code;
extern NSString * const API_Comments_Ditails_Code;

extern NSString * const API_Comment_Helpful_Code;
extern NSString * const API_Comment_Delete_Code;
extern NSString * const API_Comment_ThreadAdd_Code;
extern NSString * const API_Comment_ThreadReply_Code;
/*----------------------------------------------------------------------------- */
//登录
extern NSString * const API_Login_Code;
//获取验证码
extern NSString * const API_IdentifyCode_Code;
//发表评论
extern NSString * const API_SendComment_Code;
//获取token
extern NSString * const API_GetToken_Code;
//获取类目
extern NSString * const API_GetCategory_Code;
//发送APNS ClientID
extern NSString * const API_SendAPSClientId_Code;
//收藏列表
extern NSString * const API_FavoriteProduct_Code;
//修改个人信息
extern NSString * const API_ModifyUserInfo_Code;
//修改推送通知
extern NSString * const API_ModifyNotification_Code;
//获取个人信息
extern NSString * const API_GetUserInfo_Code;
//刷新Access_token
extern NSString * const API_RefreshToken_Code;
//获取User Tips
extern NSString * const API_GetTips_Code;


/*----------------------------------------------------------------------------- */
extern NSString *const API_MaiLog_Code;


@interface APIUrlManager : NSObject


+ (NSString *)getdefaultUrl:(NSDictionary *)backDic;
+ (NSString *)getParamUrlSring:(NSDictionary *)param;
+ (NSString *)getURLSign:(NSString *)url;
+ (NSString *)getHttpRequestUrl:(NSString *)url defaultUrl:(NSDictionary *)defauls Param:(NSDictionary *)param;
+ (NSDictionary *)getHeaderInfo;
+ (NSMutableDictionary *)getURLParameters:(NSString *)urlStr;

@end
