//
//  NewsModel.h
//  CatMovie
//
//  Created by qianfeng on 15/9/28.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "BaseModel.h"
#import "JSONModel.h"

/*@protocol NewsModel

@end*/
@interface NewsModel : BaseModel

@property(nonatomic,copy)NSString*tag;
@property(nonatomic,copy)NSString*image;
@property(nonatomic,copy)NSNumber* id;
@property(nonatomic,copy)NSNumber* commentCount;
@property(nonatomic,copy)NSNumber* type;

@property(nonatomic,copy)NSString* publishTime;
@property(nonatomic,copy)NSString*title;
@property(nonatomic,copy)NSString*title2;
@property(nonatomic,copy)NSString*summary;
@property(nonatomic,copy)NSString*summaryInfo;
@property(nonatomic,strong)NSArray* images;


/*
 "gId": 484314,
 "title": "",
 "desc": "哈灵顿身穿戏装现身片场",
 "url1": "http://img31.mtime.cn/CMS/Gallery/2015/09/27/152132.67069053.jpg",
 "url2": "http://img31.mtime.cn/CMS/Gallery/2015/09/27/152132.67069053_900.jpg"
 */
@end
