//
//  PreModel.h
//  CatMovie
//
//  Created by qianfeng on 15/9/25.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "BaseModel.h"

@interface PreModel : BaseModel
@property(nonatomic,copy)NSString*movieName;
@property(nonatomic,copy)NSString*coverImg;
@property(nonatomic,copy)NSString*url;
@property(nonatomic,copy)NSString*hightUrl;
@property(nonatomic,copy)NSString*summary;
@property(nonatomic,copy)NSString*videoTitle;

@end
/*"id": 56584,
"movieName": "《小飞侠：幻梦启航》中文预告",
"coverImg": "http://img31.mtime.cn/mg/2015/09/24/100037.30151976.jpg",
"movieId": 208219,
"url": "http://vfx.mtime.cn/Video/2015/09/24/mp4/150924091443697559.mp4",
"hightUrl": "http://vfx.mtime.cn/Video/2015/09/24/mp4/150924091443697559.mp4",
"videoTitle": "小飞侠：幻梦启航 中文版预告片3",
"videoLength": 57,
"rating": -1,
"type": [
         "冒险",
         "家庭",
         "奇幻"
         ],
"summary": "狼叔颠覆演反派"*/