//
//  HotMovie.m
//  CatMovie
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "HotModel.h"

@implementation HotModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"newActivitiesTime"]) {
        _activitiesTime = value;
    }
}

@end
