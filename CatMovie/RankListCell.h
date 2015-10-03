//
//  RankListCell.h
//  CatMovie
//
//  Created by qianfeng on 15/10/3.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RankListCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *image;

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *EnName;
@property (strong, nonatomic) IBOutlet UILabel *sumary;

@property (strong, nonatomic) IBOutlet UILabel *summary;
@property (strong, nonatomic) IBOutlet UILabel *rankNum;

@end
