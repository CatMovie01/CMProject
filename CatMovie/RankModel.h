//
//  RankModel.h
//  CatMovie
//
//  Created by qianfeng on 15/9/25.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "BaseModel.h"

@interface RankModel : BaseModel
@property(nonatomic,copy)NSString*topListNameCn;
@property(nonatomic,copy)NSString*summary ;
@property(nonatomic)NSInteger id;
@end
/*
 "id": 1302,
 "topListNameCn": "BBC评选100部最伟大的美国电影",
 "topListNameEn": "",
 "type": 0,
 "summary": "《公民凯恩》力压《教父》夺冠。"
 */