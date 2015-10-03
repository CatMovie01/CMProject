//
//  HotMovie.h
//  CatMovie
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "BaseModel.h"
#import "MSModel.h"

@interface HotModel :BaseModel

@property (nonatomic,strong) NSNumber *lid;
@property (nonatomic,copy) NSString *bImg;
@property (nonatomic,copy) NSString *date;
@property (nonatomic,strong) NSNumber *totalComingMovie;
@property (nonatomic,strong) NSNumber *activitiesTime;
@property (nonatomic,strong) NSArray<MSModel> *ms;
@property (nonatomic,copy) NSString *voucherMsg;

@end
