//
//  RankCell.h
//  CatMovie
//
//  Created by qianfeng on 15/9/26.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarViewController.h"
@interface RankCell : UITableViewCell

- (IBAction)timeButton:(id)sender;
- (IBAction)chineseButton:(id)sender;
- (IBAction)gloabButton:(id)sender;
@property(nonatomic,strong)TabBarViewController* rankList;
@end
