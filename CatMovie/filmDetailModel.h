//
//  filmDetailModel.h
//  CatMovie
//
//  Created by qianfeng on 15/9/26.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "BaseModel.h"

@interface filmDetailModel : BaseModel
@property(nonatomic,copy)NSString*title;
@property(nonatomic,copy)NSString*image;
@property(nonatomic,copy)NSString*rating;
@property(nonatomic)NSInteger id;
@end
/*"relatedObj": {
    "type": 1,
    "id": 106560,
    "title": "终结者：创世纪",
    "rating": "7.4",
    "image": "http://img31.mtime.cn/mt/2015/08/26/094552.75912154_1280X720X2.jpg"
}*/