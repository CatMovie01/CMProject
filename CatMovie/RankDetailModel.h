//
//  RankDetailModel.h
//  CatMovie
//
//  Created by qianfeng on 15/9/30.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "BaseModel.h"

@interface RankDetailModel : BaseModel
@property(nonatomic,copy)NSString*name;

@property(nonatomic,copy)NSString*nameEn;
@property(nonatomic,copy)NSString*director;
@property(nonatomic,copy)NSString*actor;
@property(nonatomic,copy)NSString*releaseDate;
@property(nonatomic,copy)NSString*posterUrl;
@property(nonatomic,copy)NSNumber*rankNum;

@property(nonatomic,copy)NSString*weekBoxOffice;

@property(nonatomic,copy)NSString*totalBoxOffice;
@property(nonatomic,copy)NSString*remark;
@end
/*
 "id": 184458,
 "name": "精灵旅社2",
 "nameEn": "Hotel Transylvania 2",
 "rankNum": 1,
 "posterUrl": "http://img31.mtime.cn/mt/2015/09/16/114251.27136506_1280X720X2.jpg",
 "decade": 2015,
 "rating": -1,
 "releaseDate": "2015年9月25日",
 "releaseLocation": "美国",
 "movieType": "动画/喜剧/家庭",
 "director": "格恩迪·塔塔科夫斯基",
 "actor": "亚当·桑德勒",
 "remark": "在第一部《精灵旅社》中，德古拉的女儿爱上了一个普通的人类男孩。在《精灵旅社2》中，德古拉当上了外公。而精灵旅社里的一切似乎都有了微妙的变化：德古拉（Dracula）那死板的“仅允许怪物进入”的酒店规则彻底靠边站，精灵旅社终于向人类敞开大门。但是，私下里，德古拉对他那半人半吸血鬼的孙子丹尼斯（Dennis）可甚是担忧——那小子身上怎么一点吸血鬼的影子都没有？预告片中，混血小家伙丹尼斯萌态惹人爱，奋力学飞的身影让人替他捏了一把汗。外公德古拉亲自上阵，打算教会小家伙飞翔。预告片中不乏喜剧元素，而画面之中又包含着浓浓的亲情。相信这一部《精灵旅社》将围绕丹尼斯这个混血小家伙展开一个有笑又有泪的温暖故事。",
 "weekBoxOffice": "周末票房\n4750",
 "totalBoxOffice": "累计票房\n4750"
 */