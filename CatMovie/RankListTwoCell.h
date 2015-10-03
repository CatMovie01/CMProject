//
//  RankListTwoCell.h
//  CatMovie
//
//  Created by qianfeng on 15/10/3.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RankListTwoCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *EnName;
@property (strong, nonatomic) IBOutlet UILabel *director;
@property (strong, nonatomic) IBOutlet UILabel *actor;
@property (strong, nonatomic) IBOutlet UILabel *releaseDate;
@property (strong, nonatomic) IBOutlet UILabel *remark;
@property (strong, nonatomic) IBOutlet UILabel *rating;
@property (strong, nonatomic) IBOutlet UILabel *rankNum;

@end
