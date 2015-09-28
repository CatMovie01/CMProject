//
//  filmModel.h
//  CatMovie
//
//  Created by qianfeng on 15/9/26.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "BaseModel.h"

@interface filmModel : BaseModel
@property(nonatomic)NSInteger id;
@property(nonatomic,copy)NSString*nickname;
@property(nonatomic,copy)NSString*title;
@property(nonatomic,copy)NSString*summary;
@property(nonatomic,copy)NSString*userImage;

@property(nonatomic,copy)NSString*retitle;
@property(nonatomic,copy)NSString*image;
@property(nonatomic,copy)NSString*rating;
@property(nonatomic)NSInteger reid;


@end
/*
 
 {
 "id": 7914562,
 "nickname": "方聿南",
 "userImage": "http://img22.mtime.cn/up/2010/07/08/092035.65057346_128X128.jpg",
 "rating": "0.0",
 "title": "风格大于逻辑",
 "summary": "　　T战警是漫威旗下的经典漫画形象，他们是一种高度发达的变种机械生命，具有刀枪不入、力大无匹、变换形体、破碎重组等超能力，他们的崛起引发了广泛恐慌，并遭到人类的残酷迫害。迫害者的领军人物约翰•康纳通过卓有成效的战略，几乎将T战警屠杀殆尽。走投无路之际，T战警们背水一战，将若干名战士送往康纳未曾出世的时空，狙杀他的母亲。然而，康纳不但派出士兵保护母亲，还企图摧毁2017年通过的《变种人人权法案》。双...",
 "relatedObj": {
 "type": 1,
 "id": 106560,
 "title": "终结者：创世纪",
 "rating": "7.4",
 "image": "http://img31.mtime.cn/mt/2015/08/26/094552.75912154_1280X720X2.jpg"
 }
 }
 */