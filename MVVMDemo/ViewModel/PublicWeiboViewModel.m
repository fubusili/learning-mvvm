//
//  PublicWeiboViewModel.m
//  MVVMDemo
//
//  Created by hc_cyril on 2017/5/16.
//  Copyright © 2017年 Clark. All rights reserved.
//

#import "PublicWeiboViewModel.h"
#import "PublicDetailViewController.h"

@implementation PublicWeiboViewModel

#pragma Public methods
- (void)fetchPublicWeibo {
    NSDictionary *parameter = @{TOKEN: ACCESSTOKEN, COUNT: @"100"};
    [NetworkingRequestClass networkingRequestGetWithURL:REQUESTPUBLICURL parameter:parameter returnValueBlock:^(id returnValue) {
        DDLog(@"%@", returnValue);
        [self fetchValueSuccessWithDic:returnValue];
    } errorCodeBlock:^(id errorCode) {
        DDLog(@"%@", errorCode);
    } failureBlock:^{
        DDLog(@"网络异常");
    }];
}

- (void)weiboDetailWithPublicModel:(PublicModel *)publicModel viewController:(UIViewController *)superController {
    DDLog(@"%@,%@,%@", publicModel.userId, publicModel.weiboId, publicModel.text);
    PublicDetailViewController *detailViewController = [PublicDetailViewController new];
    detailViewController.publicModel = publicModel;
    [superController.navigationController pushViewController:detailViewController animated:YES];
}

#pragma Private methods

- (void)fetchValueSuccessWithDic:(NSDictionary *)returnValue {
    //获取数据进行处理，传给viewController直接使用
    NSArray *statuses = returnValue[STATUSES];
    NSMutableArray *publicModelArray = [[NSMutableArray alloc] initWithCapacity:statuses.count];
    for (int i = 0; i < statuses.count; i ++) {
        
        PublicModel *publicModel = [[PublicModel alloc] init];
        
        NSDateFormatter *iosDateFormater = [[NSDateFormatter alloc] init];
        iosDateFormater.dateFormat = @"EEE MMM D HH:mm:ss Z yyyy";
        iosDateFormater.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
        NSDate *date = [iosDateFormater dateFromString:statuses[i][CREATETIME]];
        
        NSDateFormatter *resultFormater = [[NSDateFormatter alloc] init];
        [resultFormater setDateFormat:@"MM月dd日 HH:mm"];
        
        publicModel.date = statuses[i][CREATETIME];//[resultFormater stringFromDate:date];
        publicModel.userName = statuses[i][USER][USERNAME];
        publicModel.text = statuses[i][WEIBOTEXT];
        publicModel.imageUrl = [NSURL URLWithString:statuses[i][USER][HEADIMAGEURL]];
        publicModel.userId = statuses[i][USER][UID];
        publicModel.weiboId = statuses[i][WEIBOID];
        
        [publicModelArray addObject:publicModel];
    }
    self.returnBlock(publicModelArray);
}

- (void)errorCodeWithErrorDic:(NSDictionary *)errorDic {
    self.errorBlock(errorDic);
}
// 网络异常处理
- (void)netFailure {
    self.failureBlock();
}

@end
