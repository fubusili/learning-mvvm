//
//  NetworkingRequestClass.m
//  MVVMDemo
//
//  Created by hc_cyril on 2017/5/15.
//  Copyright © 2017年 Clark. All rights reserved.
//

#import "NetworkingRequestClass.h"

@implementation NetworkingRequestClass
//检查网络可连接性
+ (BOOL)networkingReachability {
    __block BOOL netState = NO;
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
                case AFNetworkReachabilityStatusReachableViaWWAN:
                case AFNetworkReachabilityStatusReachableViaWiFi:
                netState = YES;
                break;
                case AFNetworkReachabilityStatusNotReachable:
                netState = NO;
                break;
            default:
                netState = NO;
                break;
        }
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    return netState;
}

//post请求
+ (void)networkingRequestPostWithURL:(NSString *)urlString parameter:(NSDictionary *)parameter returnValueBlock:(ReturnValueBlock)retunrBlock errorCodeBlock:(ErrorCodeBlock)errorBlock failureBlock:(FailureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer     = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer    = [AFHTTPResponseSerializer serializer];
    [manager POST:urlString parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        DDLog(@"%@", dic);
        retunrBlock(dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock();
    }];
}

+ (void)networkingRequestGetWithURL:(NSString *)urlString parameter:(NSDictionary *)parameter returnValueBlock:(ReturnValueBlock)retunrBlock errorCodeBlock:(ErrorCodeBlock)errorBlock failureBlock:(FailureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer     = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer    = [AFHTTPResponseSerializer serializer];
    [manager GET:urlString parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        DDLog(@"%@", dic);
        retunrBlock(dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock();
    }];
}
@end
