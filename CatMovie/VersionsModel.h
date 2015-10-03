//
//  VersionsModel.h
//  CatMovie
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "BaseModel.h"

@protocol VersionsModel <NSObject>

@end

@interface VersionsModel : BaseModel

@property (nonatomic,copy) NSString *myenum;
@property (nonatomic,copy) NSString *version;

@end

/*
 {
 "enum": 3,
 "version": "IMAX"
 }
*/