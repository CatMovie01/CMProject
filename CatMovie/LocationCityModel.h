//
//  LocationCityModel.h
//  CatMovie
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "BaseModel.h"

@interface LocationCityModel : BaseModel

@property (nonatomic,copy) NSString *cityId;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *pinyinShort;

@end

/*
 {
	"cityId": 489,
	"name": "郑州",
	"pinyinShort": "zz"
 }
*/