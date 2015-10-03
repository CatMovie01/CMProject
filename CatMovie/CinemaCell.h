//
//  CinemaCell.h
//  CatMovie
//
//  Created by qianfeng on 15/10/3.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinemaModel.h"

@interface CinemaCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cinameName;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *minPrice;


-(void)showWithCinema:(CinemaModel *)model;

@end
