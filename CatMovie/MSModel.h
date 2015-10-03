//
//  MSModel.h
//  CatMovie
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "BaseModel.h"
#import "VersionsModel.h"

@protocol MSModel <NSObject>
@end

@interface MSModel : BaseModel

@property (nonatomic,strong) NSNumber *id;
@property (nonatomic,copy) NSString *t;
@property (nonatomic,copy) NSString *tCn;
@property (nonatomic,copy) NSString *tEn;
@property (nonatomic,strong) NSNumber *r;
@property (nonatomic,strong) NSNumber *rc;
@property (nonatomic,copy) NSString *img;
@property (nonatomic,copy) NSString *dN;
@property (nonatomic,copy) NSString *aN1;
@property (nonatomic,copy) NSString *aN2;
@property (nonatomic,strong) NSArray *p;
@property (nonatomic,copy) NSString *rd;
@property (nonatomic,copy) NSString *d;
@property (nonatomic,strong) NSNumber *cC;
@property (nonatomic,strong) NSNumber *sC;
@property (nonatomic,strong) NSNumber *rsC;
@property (nonatomic,strong) NSNumber *NearestCinemaCount;
@property (nonatomic,strong) NSNumber *NearestShowtimeCount;
@property (nonatomic,strong) NSNumber *NearestDay;
@property (nonatomic,strong) NSNumber *ua;
@property (nonatomic,copy) NSString *isNew;
@property (nonatomic,copy) NSString *isHot;
@property (nonatomic,copy) NSString *isTicket;
@property (nonatomic,copy) NSString *commonSpecial;
@property (nonatomic,strong) NSNumber *wantedCount;
@property (nonatomic,copy) NSString *movieType;
@property (nonatomic,copy) NSString *is3D;
@property (nonatomic,copy) NSString *isIMAX;
@property (nonatomic,copy) NSString *isIMAX3D;
@property (nonatomic,copy) NSString *isDMAX;
@property (nonatomic,strong) NSArray<VersionsModel> *versions;

@end

/*
 {
 "id": 208076,
 "t": "港囧",
 "tCn": "港囧",
 "tEn": "Lost In Hongkong",
 "r": 6.2,
 "rc": 12366,
 "img": "http://img31.mtime.cn/mt/2015/09/21/113105.22486491_1280X720X2.jpg",
 "dN": "徐峥",
 "aN1": "徐峥",
 "aN2": "赵薇",
 "p": [
 "喜剧"
 ],
 "rd": "20150925",
 "d": "114分钟",
 "cC": 35,
 "sC": 1435,
 "rsC": 0,
 "NearestCinemaCount": 35,
 "NearestShowtimeCount": 848,
 "NearestDay": 1443484800,
 "ua": 0,
 "isNew": false,
 "isHot": true,
 "isTicket": true,
 "commonSpecial": "徐峥决心囧遍全世界",
 "wantedCount": 8715,
 "movieType": "喜剧",
 "is3D": false,
 "isIMAX": true,
 "isIMAX3D": false,
 "isDMAX": false,
 "versions": [
 {
 "enum": 3,
 "version": "IMAX"
 }
 ]
 }
*/