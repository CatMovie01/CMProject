//
//  LocationInfo.h
//  CatMovie
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@class LocationCityModel;
@class LocationInfo;

@protocol LocationInfoDelegate <NSObject>

-(void)UpdateCityCinema:(LocationInfo *)info;

@end

@interface LocationInfo : NSObject

@property (nonatomic,weak) id<LocationInfoDelegate> delegate;

//定位  城市编码
@property (nonatomic,strong) NSNumber *cityCode;
//城市 name
@property (nonatomic,copy) NSString *cityName;

@property (nonatomic,copy) NSString *pinyinShort;


+(LocationInfo *)SharedCity;
@end
