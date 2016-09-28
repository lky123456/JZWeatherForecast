//
//  JZRequestManager.h
//  JZWeatherForecast
//
//  Created by 梁奎元 on 16/9/28.
//  Copyright © 2016年 济源职业技术学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JZRequestManager : NSObject<NSURLSessionDataDelegate>

@property (nonatomic, strong,nonnull) NSURLSession  *session;

/**
 *    请求管理单例
 */
+ (nullable instancetype)manager;

/**
 *  GET  请求
 *
 *  @param URLString  <#URLString description#>
 *  @param parameters <#parameters description#>
 *  @param success    <#success description#>
 *  @param failure    <#failure description#>

 */
- (nullable NSURLSessionDataTask *)GET:(nonnull NSString *)URLString
                            parameters:(nonnull NSDictionary *)parameters
                               success:(void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                               failure:(void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;

/**
 *  GET  请求  进度
 *
 *  @param URLString        <#URLString description#>
 *  @param parameters       <#parameters description#>
 *  @param downloadProgress <#downloadProgress description#>
 *  @param success          <#success description#>
 *  @param failure          <#failure description#>
 *
 */
- (nullable NSURLSessionDataTask *)GET:(nonnull NSString *)URLString
                            parameters:(nullable id)parameters
                              progress:(nullable void (^)(NSProgress *downloadProgress))downloadProgress
                               success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;

/**
 *  POST 请求
 *
 *  @param URLString  <#URLString description#>
 *  @param parameters <#parameters description#>
 *  @param success    <#success description#>
 *  @param failure    <#failure description#>
 */
- (nullable NSURLSessionDataTask *)POST:(NSString *)URLString
                             parameters:(nullable id)parameters
                                success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;
/**
 *  POST 请求  进度
 *
 *  @param URLString      <#URLString description#>
 *  @param parameters     <#parameters description#>
 *  @param uploadProgress <#uploadProgress description#>
 *  @param success        <#success description#>
 *  @param failure        <#failure description#>
 *
 *  @return <#return value description#>
 */
- (nullable NSURLSessionDataTask *)POST:(NSString *)URLString
                             parameters:(nullable id)parameters
                               progress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress
                                success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;
@end
