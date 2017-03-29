//
//  AFNManager.h
//  XJChain
//
//  Created by 曹宇 on 16/12/19.
//  Copyright © 2016年 曹宇. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface AFNManager : NSObject

+ (AFNManager *)shareInstance;
//  post请求数据
+ (void)postNetWorkWithUrl:(NSString *)url body:(NSDictionary *)body success:(void(^)(id data))successBlock failure:(void(^)(NSError *error))failureBlock progress:(void(^)(unsigned long long size, unsigned long long total))progressBlock;

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;


@end
