//
//  MoviesModel.h
//  CatMovie
//
//  Created by qianfeng on 15/10/3.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "BaseModel.h"

@interface MoviesModel : BaseModel
@property(nonatomic,copy)NSString*name;
@property(nonatomic,copy)NSString*nameEn;
@property(nonatomic,copy)NSString*posterUrl;
@property(nonatomic,copy)NSString*releaseDate;
@property(nonatomic,copy)NSString*director;
@property(nonatomic,copy)NSString*actor;
@property(nonatomic,copy)NSNumber*rankNum;
@property(nonatomic,copy)NSString*remark;
@property(nonatomic,copy)NSNumber*rating;
@end
/*
 "id": 78590,
 "name": "少年时代",
 "nameEn": "Boyhood",
 "rankNum": 1,
 "posterUrl": "http://img31.mtime.cn/mt/2014/07/11/154023.30453539_1280X720X2.jpg",
 "decade": 2014,
 "rating": 7.4,
 "releaseDate": "2014年7月18日",
 "releaseLocation": "美国",
 "movieType": "剧情",
 "director": "理查德·林克莱特",
 "actor": "埃拉·科尔特兰",
 "actor2": "帕特丽夏·阿奎特",
 "remark": "本片可以说是一部成长史，它仔细描画了孩子的成长过程，及其父母亲各个方面的变化。它不会像某些影片似的一下子就是“多少年过后”，它是逐年的进行过渡，可以让观众细致入微的体会到岁月的痕迹。"
 }
 
 */