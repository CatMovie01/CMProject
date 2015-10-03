//
//  hotCell.m
//  CatMovie
//
//  Created by qianfeng on 15/9/22.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "HotCell.h"

@implementation hotCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)showDataWithModel:(MSModel *)model
{
    [self.hotImageView sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"占位图"]];
//    self.hotMK.text=[NSString stringWithFormat:@"%@",model.mk];
    self.hotRemark.text=[NSString stringWithFormat:@"今天%@家影院%@场",model.NearestCinemaCount,model.NearestShowtimeCount];
    self.hotShowInfo.text=[NSString stringWithFormat:@"“%@”",model.commonSpecial];    
    self.hotTitle.text=model.tCn;
}



- (IBAction)hotClick:(UIButton *)sender {
}
@end
