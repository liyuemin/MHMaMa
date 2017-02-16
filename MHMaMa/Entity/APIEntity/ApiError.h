//
//  TRError.h
//  TRGatherLove
//
//  Created by 李沛然 on 16/5/23.
//  Copyright © 2016年 liyuemin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MErrorType) {
   
    MErrorTypeServerExcuteDefault = 0,
    MErrorTypeServerExcuteError = 1000,

};

@interface ApiError : NSError

@property (nonatomic, assign) NSInteger statusCode;

@end
