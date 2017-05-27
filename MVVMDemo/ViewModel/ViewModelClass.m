//
//  ViewModelClass.m
//  MVVMDemo
//
//  Created by hc_cyril on 2017/5/16.
//  Copyright © 2017年 Clark. All rights reserved.
//

#import "ViewModelClass.h"

@implementation ViewModelClass
- (void)networkingStateWithNetConnectBlock:(NetworkingBlock)netConnectBlock {
    BOOL netState = [NetworkingRequestClass networkingReachability];
    netConnectBlock(netState);
}

- (void)setblockWithReturnBlock:(ReturnValueBlock)returnBlock errorBlock:(ErrorCodeBlock)errorBlock failureBlock:(FailureBlock)failureBlock {
    _returnBlock = returnBlock;
    _errorBlock = errorBlock;
    _failureBlock = failureBlock;
}

@end
