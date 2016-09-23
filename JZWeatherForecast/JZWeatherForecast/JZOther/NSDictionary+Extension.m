
//
//  NSDictionary+Extension.m
//  JZWeatherForecast
//
//  Created by 梁奎元 on 16/9/23.
//  Copyright © 2016年 济源职业技术学院. All rights reserved.
//

#import "NSDictionary+Extension.h"

@implementation NSDictionary (Extension)


-(NSString *)getDictString
{
    NSMutableString *str = [NSMutableString string];
    
   [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
       
       [str appendString:key];
       [str appendString:@"="];
       [str appendString:obj];
       [str appendString:@"&"];
   }];
    
    return [str substringToIndex:(str.length-1)];
}
@end
