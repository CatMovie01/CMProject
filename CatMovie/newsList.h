//
//  newsList.h
//  CatMovie
//
//  Created by qianfeng on 15/9/28.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "JSONModel.h"
#import "NewsModel.h"
@interface newsList : JSONModel
@property(nonatomic,strong)NSArray*newsList;
@property(nonatomic)NSInteger pageCount;
@property(nonatomic)NSInteger totalCount;
@end
