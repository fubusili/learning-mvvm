//
//  PublicModel.h
//  MVVMDemo
//
//  Created by hc_cyril on 2017/5/16.
//  Copyright © 2017年 Clark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicModel : NSObject
@property (copy, nonatomic) NSString *userId;
@property (copy, nonatomic) NSString *weiboId;
@property (copy, nonatomic) NSString *userName;
@property (strong, nonatomic) NSURL *imageUrl;
@property (copy, nonatomic) NSString *date;
@property (copy, nonatomic) NSString *text;
@end
