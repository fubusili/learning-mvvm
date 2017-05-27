//
//  ViewModelClass.h
//  MVVMDemo
//
//  Created by hc_cyril on 2017/5/16.
//  Copyright © 2017年 Clark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewModelClass : NSObject
@property (strong, nonatomic) ReturnValueBlock returnBlock;
@property (strong, nonatomic) ErrorCodeBlock errorBlock;
@property (strong, nonatomic) FailureBlock failureBlock;

- (void)networkingStateWithNetConnectBlock:(NetworkingBlock)netConnectBlock;

- (void)setblockWithReturnBlock:(ReturnValueBlock)returnBlock errorBlock:(ErrorCodeBlock)errorBlock failureBlock:(FailureBlock)failureBlock;

@end
