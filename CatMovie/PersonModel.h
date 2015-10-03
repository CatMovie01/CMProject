//
//  PersonModel.h
//  CatMovie
//
//  Created by qianfeng on 15/10/3.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "BaseModel.h"

@interface PersonModel : BaseModel
@property(nonatomic,copy)NSString*nameCn;
@property(nonatomic,copy)NSString*nameEn;
@property(nonatomic,copy)NSString*posterUrl;
@property(nonatomic,copy)NSString*sex;
@property(nonatomic,copy)NSNumber *birthYear;
@property(nonatomic,copy)NSString*birthDay;
@property(nonatomic,copy)NSString*birthLocation;
@property(nonatomic,copy)NSString*constellation;
@property(nonatomic,copy)NSString*summary;
@property(nonatomic,copy)NSNumber* id;
@property(nonatomic,copy)NSNumber* rankNum;
@end
/* "id": 916978,
 "nameCn": "吉姆·帕森斯",
 "nameEn": "Jim Parsons",
 "rankNum": 1,
 "posterUrl": "http://img31.mtime.cn/ph/2014/03/15/185655.48403937_1280X720X2.jpg",
 "rating": 9.4,
 "sex": "男",
 "birthYear": 1973,
 "birthDay": "3月24日",
 "birthLocation": "美国德州休斯敦",
 "constellation": "白羊座",
 "summary": "年收入2900万美元"
 */