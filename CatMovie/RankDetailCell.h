//
//  RankDetailCell.h
//  CatMovie
//
//  Created by qianfeng on 15/9/30.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RankDetailCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *EnName;
@property (strong, nonatomic) IBOutlet UILabel *Director;
@property (strong, nonatomic) IBOutlet UILabel *actor;
@property (strong, nonatomic) IBOutlet UILabel *timer;
@property (strong, nonatomic) IBOutlet UILabel *weekBoxOffice;
@property (strong, nonatomic) IBOutlet UILabel *totalBoxOffice;
@property (strong, nonatomic) IBOutlet UILabel *rankNum;

@end
