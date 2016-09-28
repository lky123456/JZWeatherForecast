//
//  JZRequestManager.m
//  JZWeatherForecast
//
//  Created by 梁奎元 on 16/9/28.
//  Copyright © 2016年 济源职业技术学院. All rights reserved.
//

#import "JZRequestManager.h"

@implementation JZRequestManager

+(instancetype)manager
{
    static dispatch_once_t onceToken;
    
    static JZRequestManager *manager = nil;
    
    dispatch_once(&onceToken, ^{
        
        manager = [[self alloc] init];
        
    });
    
    return manager;
}


#pragma mark - GET 请求实现

-(NSURLSessionDataTask *)GET:(NSString *)URLString
                  parameters:(NSDictionary *)parameters
                     success:(void (^)(NSURLSessionDataTask *, id _Nullable))success
                     failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError *))failure
{
    return [self GET:URLString parameters:parameters progress:nil success:success failure:failure];
}

-(NSURLSessionDataTask *)GET:(NSString *)URLString
                  parameters:(id)parameters
                    progress:(void (^)(NSProgress *))downloadProgress
                     success:(void (^)(NSURLSessionDataTask *, id _Nullable))success
                     failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError *))failure
{
    NSURLSessionDataTask *dataTask = [self dataTaskWithHTTPMethod:@"GET"
                                                        URLString:URLString
                                                       parameters:parameters
                                                   uploadProgress:nil
                                                 downloadProgress:downloadProgress
                                                          success:success
                                                          failure:failure];
    
    [dataTask resume];
    
    return dataTask;
}



#pragma mark - POST 请求实现


-(NSURLSessionDataTask *)POST:(NSString *)URLString
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask *, id _Nullable))success
                      failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError *))failure
{
    return [self POST:URLString parameters:parameters progress:nil success:success failure:failure];
}

-(NSURLSessionDataTask *)POST:(NSString *)URLString
                   parameters:(id)parameters
                     progress:(void (^)(NSProgress *))uploadProgress
                      success:(void (^)(NSURLSessionDataTask *, id _Nullable))success
                      failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError *))failure
{
   NSURLSessionDataTask *task = [self dataTaskWithHTTPMethod:@""
                                                   URLString:URLString
                                                  parameters:parameters
                                              uploadProgress:uploadProgress
                                            downloadProgress:nil
                                                     success:success
                                                     failure:failure];
    [task resume];
    
    return task;
}


#pragma mark - 公共方法

- (NSURLSessionDataTask *)dataTaskWithHTTPMethod:(NSString *)method
                                       URLString:(NSString *)URLString
                                      parameters:(id)parameters
                                  uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgress
                                downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgress
                                         success:(void (^)(NSURLSessionDataTask *, id))success
                                         failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URLString]];
    
    __block NSURLSessionDataTask *dataTask = nil;
    dataTask = [self.session dataTaskWithRequest:request];
    
    return dataTask;
}



#pragma mark - NSURLSessionDataDelegate

// 接收到服务器的响应时调用
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    completionHandler(NSURLSessionResponseAllow);
}

// 接收到服务器返回的数据时调用
// data 此次接收到的数据
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{

}

// 请求完毕时调用, 如果error有值, 代表请求错误
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    NSLog(@"didCompleteWithError");
}




#pragma mark - lazy

-(NSURLSession *)session
{
    if (!_session) {
        _session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    }
    return _session;
}
@end
