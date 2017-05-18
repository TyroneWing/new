//
//  ZYHTTPRequest.h
//
//  Created by yi on 17/5/16.
//  Copyright © 2017年 yi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYHTTPRequest : NSObject


/**
 GET 请求

 @param urlString 请求地址
 @param beforeRequest 请求之前做的操作
 @param requestSuccess 请求完成，解析数据
 @param requestFail 请求错误返回error信息
 */
+ (void)GETUrl:(NSString *)urlString
 beforeRequest:(void (^)())beforeRequest
requestSuccess:(void (^)(id resObj))requestSuccess
   requestFail:(void (^)(NSError *error))requestFail;


/**
 POST 请求
 
 @param urlString 请求地址
 @param beforeRequest 请求之前做的操作
 @param requestSuccess 请求完成，解析数据
 @param requestFail 请求错误返回error信息
 */
+ (void)POSTUrl:(NSString *)urlString parameters:(NSDictionary *)parameters
  beforeRequest:(void (^)())beforeRequest
 requestSuccess:(void (^)(id responseObject))requestSuccess
    requestFail:(void (^)(NSError *error))requestFail;

@end
