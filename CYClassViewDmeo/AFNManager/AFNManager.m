//
//  AFNManager.m
//  XJChain
//
//  Created by 曹宇 on 16/12/19.
//  Copyright © 2016年 曹宇. All rights reserved.
//

#import "AFNManager.h"
#import "AFNetworking.h"

@implementation AFNManager

static AFNManager *afnManager;
static AFHTTPSessionManager *_networkManager;




+ (AFNManager *)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        afnManager = [[self alloc]init];
    });
    return afnManager;
}
+ (AFHTTPSessionManager *)networkManager {
    if (!_networkManager) {
        _networkManager = [self defaultManager];
        _networkManager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringCacheData;
    }
    return _networkManager;
}
+ (AFHTTPSessionManager *)defaultManager {
    AFHTTPSessionManager *client = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:[self defaultURL]]];
    client.requestSerializer.timeoutInterval = 30;
    
    AFJSONResponseSerializer *serializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    serializer.removesKeysWithNullValues = YES;
    client.responseSerializer = serializer;
    return client;
}
+ (NSString *)defaultURL {
    return @"";
}

+ (void)postNetWorkWithUrl:(NSString *)url body:(NSDictionary *)body success:(void (^)(id))successBlock failure:(void (^)(NSError *))failureBlock progress:(void (^)(unsigned long long, unsigned long long))progressBlock{
    
    AFHTTPSessionManager *manage = [self networkManager];
    manage.requestSerializer = [AFJSONRequestSerializer serializer];
//    manage.responseSerializer = [AFHTTPResponseSerializer serializer];

    manage.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"text/json", @"application/json", @"text/javascript", @"text/html", nil];
    [manage.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manage.requestSerializer.timeoutInterval = 120;//服务器超时120秒
    [manage POST:url parameters:body progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//       NSString *result = [responseObject stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//        NSLog(@"aaaaaaaaaaaaaaaa%@",result);
//        NSString *retStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        NSString *str2 = [[responseObject objectForKey:@"message"]  stringByRemovingPercentEncoding];

        
        NSLog(@"ddddddddddddddd%@===== %@",responseObject,str2);


//       NSDictionary *dic = [AFNManager dictionaryWithJsonString:retStr];
        
       successBlock(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        NSLog(@"kokokokokoko%@",error);
        
    }];

}
//  json转字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        
        return nil;
        
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                         
                                                          error:&err];
    
    if(err) {
        
        NSLog(@"json解析失败：%@",err);
        
        return nil;
        
    }
    
    return dic;
    
}





@end

