//
//  PublicWeiboViewModel.h
//  MVVMDemo
//
//  Created by hc_cyril on 2017/5/16.
//  Copyright © 2017年 Clark. All rights reserved.
//

#import "ViewModelClass.h"
#import "PublicModel.h"


@interface PublicWeiboViewModel : ViewModelClass
- (void)fetchPublicWeibo;
- (void)weiboDetailWithPublicModel:(PublicModel *)publicModel viewController:(UIViewController *)superController;
@end
