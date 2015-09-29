//
//  FourModel.h
//  CatMovie
//
//  Created by qianfeng on 15/9/28.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "JSONModel.h"
@protocol FourModel
@end

@interface FourModel : JSONModel
@property(nonatomic)NSInteger gId;
@property(nonatomic,copy)NSString*desc;
@property(nonatomic,copy)NSString*url1;
@property(nonatomic,copy)NSString*url2;
@end
