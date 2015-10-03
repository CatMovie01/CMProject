//
//  CinemaCell.m
//  CatMovie
//
//  Created by qianfeng on 15/10/3.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "CinemaCell.h"

@implementation CinemaCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)showWithCinema:(CinemaModel *)model
{
    self.cinameName.text=model.cinameName;
    self.address.text=model.address;
    self.minPrice.text=[NSString stringWithFormat:@"￥%d起",[model.minPrice intValue]/100];    
}

@end
