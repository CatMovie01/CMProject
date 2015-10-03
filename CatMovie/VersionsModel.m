//
//  VersionsModel.m
//  CatMovie
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "VersionsModel.h"

@implementation VersionsModel


-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"enum"]) {
        _myenum=value;
    }
}


@end
