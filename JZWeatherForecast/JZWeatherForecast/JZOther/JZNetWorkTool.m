
//
//  JZNetTools.m
//  JZWeatherForecast
//
//  Created by 梁奎元 on 16/9/23.
//  Copyright © 2016年 济源职业技术学院. All rights reserved.
//

#import "JZNetWorkTool.h"


@interface JZNetWorkTool()

/**
 *  <#Description#>
 */
@property (nonatomic, strong) NSURLSession  *session;

@end


@implementation JZNetWorkTool

+(instancetype)shareNetWorkTool
{
    static dispatch_once_t onceToken;
    
     static JZNetWorkTool *netWorkTool = nil;
    
    dispatch_once(&onceToken, ^{
       
        netWorkTool = [[self alloc] init];
    
    });

    return netWorkTool;
}

-(void)getCityWeatherWithLocation:(NSString *)location
                     FinshedBlock:(Finished)finished
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:JZXZWeatherAppkey forKey:JZKEY];
    [dict setObject:location forKey:JZLOCATION];
    [dict setObject: JZLanguageChineseS forKey:JZLANGAUGE];
    [dict setObject:JZC  forKey:JZUNIT];
    
    NSString *urlStr = [NSString stringWithFormat:@"%@?%@",NowURL,[dict getDictString]];
    
   [[self.session dataTaskWithURL:[NSURL URLWithString:urlStr] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            
            finished(false,nil,error);
            
        }else{
        
          NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            
            finished(true,dict,nil);
        }
  
    }] resume];

}
-(void)getDailyWeatherWithStartDayType:(startDayType )dayType
                              location:(NSString *)location
                                  days:(NSString *)days
                          FinshedBlock:(Finished)finished
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:JZXZWeatherAppkey forKey:JZKEY];
    [dict setObject:location forKey:JZLOCATION];
    [dict setObject:JZLanguageChineseS forKey:JZLANGAUGE];
    [dict setObject:JZC forKey:JZUNIT];
    [dict setObject:[NSString stringWithFormat:@"%zd",dayType] forKey:JZStart];
    [dict setObject:days forKey:JZDays];
    
     NSString *urlStr = [NSString stringWithFormat:@"%@?%@",delayURL,[dict getDictString]];
    
    [[self.session dataTaskWithURL:[NSURL URLWithString:urlStr] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            finished(false,nil,error);
        }else
        {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            finished(true,dict,nil);
        }
        
    } ] resume];
   
    //https://api.thinkpage.cn/v3/weather/now.json?language=zh-Hans&start=0&key=ktzdofzqcnj5fcr8&days=5&location=beijing&unit=c
    //https://api.thinkpage.cn/v3/weather/daily.json?key=ktzdofzqcnj5fcr8&location=beijing&language=zh-Hans&unit=c&start=0&days=5
    
}

#pragma mark - lazy
-(NSURLSession *)session
{
    if (!_session) {
        _session = [NSURLSession sharedSession];
    }
    return _session;
}


@end
