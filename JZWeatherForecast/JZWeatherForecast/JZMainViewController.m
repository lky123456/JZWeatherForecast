//
//  ViewController.m
//  JZWeatherForecast
//
//  Created by 梁奎元 on 16/9/23.
//  Copyright © 2016年 济源职业技术学院. All rights reserved.
//

#import "JZMainViewController.h"


@interface JZMainViewController ()

@end

@implementation JZMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
//    [[JZNetWorkTool shareNetWorkTool] getCityWeatherWithLocation:@"beijing" FinshedBlock:^(BOOL success, NSDictionary *result, NSError *error) {
//        
//        NSLog(@"%@",result);
//        
//    }];

    
    [[JZNetWorkTool shareNetWorkTool] getDailyWeatherWithStartDayType:startDayTypeToday
                                                             location:@"beijing"
                                                                 days:@"5"
                                                         FinshedBlock:^(BOOL success, NSDictionary *result, NSError *error) {
                                                             
                                                             
                                                             NSLog(@"%@",result);
                                                             
                                                             
                                                             
                                                         }];
}

@end
