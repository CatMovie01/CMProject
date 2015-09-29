//
//  HeaderNewsCell.h
//  CatMovie
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsViewController.h"
#import "TabBarViewController.h"
@interface HeaderNewsCell : UITableViewCell
@property(nonatomic,strong)TabBarViewController* NewsView;
- (IBAction)ChinaSort:(UIButton *)sender;
- (IBAction)globalSort:(UIButton *)sender;


@end
