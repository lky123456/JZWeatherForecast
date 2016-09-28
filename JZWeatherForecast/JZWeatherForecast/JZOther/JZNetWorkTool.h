//
//  JZNetTools.h
//  JZWeatherForecast
//
//  Created by 梁奎元 on 16/9/23.
//  Copyright © 2016年 济源职业技术学院. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
     startDayTypeBeforeYesterday = -2,
     startDayTypeYesterday,
     startDayTypeToday = 0,
     startDayTypeTomorow,
} startDayType;



/**
 *  基URL
 */
#define NowURL @"https://api.thinkpage.cn/v3/weather/now.json"

/**
 *  <#describe#>
 */
#define delayURL @"https://api.thinkpage.cn/v3/weather/daily.json"


/**
 *  <#describe#>
 */
#define  JZKEY  @"key"

/**
 *  <#describe#>
 */
#define JZLOCATION  @"location"

/**
 *  <#describe#>
 */
#define JZLANGAUGE  @"language"

/**
 *  <#describe#>
 */
#define JZUNIT @"unit"

/**
 *  <#describe#>
 */
#define JZC  @"c"

/**
 *  <#describe#>
 */
#define JZStart @"start"

/**
 *  <#describe#>
 */
#define JZDays  @"days"

/**
 *  网络请求回调block
 *
 *  @param success 是否成功
 *  @param result  结果
 *  @param error   错误
 */
typedef void(^Finished)(BOOL success,NSDictionary *result,NSError *error);


@interface JZNetWorkTool : NSObject

/**
 *  请求类实例
 */
+(instancetype)shareNetWorkTool;

/**
 *  指定城市的天气
 *
 *  @param location 城市
 */
- (void)getCityWeatherWithLocation:(NSString *)location
                      FinshedBlock:(Finished)finished;


/**
 *  获取前后几天的天气
 *
 *  @param dayType
 *  @param location 城市
 *  @param days     几天
 */
- (void)getDailyWeatherWithStartDayType:(startDayType )dayType
                               location:(NSString *)location
                                   days:(NSString *)days
                           FinshedBlock:(Finished)finished;
@end
