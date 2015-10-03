//
//  CinemaFeatureModel.h
//  CatMovie
//
//  Created by qianfeng on 15/9/30.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "BaseModel.h"

@protocol CinemaFeatureModel <NSObject>
@end

@interface CinemaFeatureModel : BaseModel

@property (nonatomic,copy) NSString *has3D;
@property (nonatomic,copy) NSString *hasIMAX;
@property (nonatomic,copy) NSString *hasVIP;
@property (nonatomic,copy) NSString *hasPark;
@property (nonatomic,copy) NSString *hasServiceTicket;
@property (nonatomic,copy) NSString *hasWifi;
@property (nonatomic,copy) NSString *hasLoveseat;
@property (nonatomic,copy) NSString *hasFeature4K;
@property (nonatomic,copy) NSString *hasFeatureDolby;
@property (nonatomic,copy) NSString *hasFeatureHuge;
@property (nonatomic,copy) NSString *hasFeature4D;

@end

/*
 "feature": {
 "has3D": 1,
 "hasIMAX": 0,
 "hasVIP": 0,
 "hasPark": 1,
 "hasServiceTicket": 1,
 "hasWifi": 1,
 "hasLoveseat": 0,
 "hasFeature4K": 0,
 "hasFeatureDolby": 0,
 "hasFeatureHuge": 0,
 "hasFeature4D": 0
 },

*/