//
//  ImagesModel.h
//  CatMovie
//
//  Created by qianfeng on 15/9/28.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "JSONModel.h"
#import "FourModel.h"
@protocol ImagesModel
@end
@interface ImagesModel : JSONModel
@property(nonatomic,strong)NSDictionary<FourModel>*images;
@end
