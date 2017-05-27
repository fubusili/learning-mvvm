//
//  NetworkingRequestClass.h
//  MVVMDemo
//
//  Created by hc_cyril on 2017/5/15.
//  Copyright © 2017年 Clark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkingRequestClass : NSObject

/**
 检测网络可连接性

 @return YES:标识网络正常；NO:网络不正常
 */
+ (BOOL)networkingReachability;


/**
 post请求网络

 @param urlString url
 @param parameter 参数
 @param retunrBlock 正常返回值
 @param errorBlock 错误返回
 @param failureBlock 失败返回
 */
+ (void)networkingRequestPostWithURL:(NSString *)urlString parameter:(NSDictionary *)parameter returnValueBlock:(ReturnValueBlock)retunrBlock errorCodeBlock:(ErrorCodeBlock)errorBlock failureBlock:(FailureBlock)failureBlock;


/**
 get请求

 @param urlString url
 @param parameter 参数
 @param retunrBlock 正常返回
 @param errorBlock 错误返回
 @param failureBlock 失败返回
 */
+ (void)networkingRequestGetWithURL:(NSString *)urlString parameter:(NSDictionary *)parameter returnValueBlock:(ReturnValueBlock)retunrBlock errorCodeBlock:(ErrorCodeBlock)errorBlock failureBlock:(FailureBlock)failureBlock;
@end
