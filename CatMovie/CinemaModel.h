//
//  CinemaModel.h
//  CatMovie
//
//  Created by qianfeng on 15/9/30.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "BaseModel.h"
#import "CinemaFeatureModel.h"

@interface CinemaModel : BaseModel

@property (nonatomic,strong) NSNumber *cinemaId;
@property (nonatomic,copy) NSString *cinameName;
@property (nonatomic,copy) NSString *address;
@property (nonatomic,strong) NSNumber *districtID;
@property (nonatomic,copy) NSString *isETicket;
@property (nonatomic,copy) NSString *isTicket;
@property (nonatomic,strong) NSNumber *ratingFinal;
@property (nonatomic,strong) NSNumber *longitude;
@property (nonatomic,strong) NSNumber *latitude;
@property (nonatomic,strong) NSNumber *baiduLongitude;
@property (nonatomic,strong) NSNumber *baiduLatitude;
@property (nonatomic,strong) NSNumber *movieCount;
@property (nonatomic,strong) NSNumber *showtimeCount;
@property (nonatomic,strong) NSNumber *minPrice;

@property (nonatomic,strong) NSDictionary<CinemaFeatureModel> *feature;

@end


/*
 {
 "cinemaId": 6163,
 "cinameName": "郑州比高电影城",
 "address": "郑州市二七区南三环与连云路交叉路口橄榄城都市广场5层",
 "districtID": 1460,
 "isETicket": false,
 "isTicket": true,
 "ratingFinal": 7.411536,
 "longitude": 119.7069,
 "latitude": 30.22321,
 "baiduLongitude": 113.6811,
 "baiduLatitude": 34.70453,
 "movieCount": 23,
 "showtimeCount": 173,
 "minPrice": 3000,
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
 "couponActivityList": []
 },

*/