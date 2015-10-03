//
//  hotCell.h
//  CatMovie
//
//  Created by qianfeng on 15/9/22.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "hotModel.h"

@interface hotCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *hotImageView;
@property (weak, nonatomic) IBOutlet UILabel *hotTitle;
@property (weak, nonatomic) IBOutlet UILabel *hotRemark;
@property (weak, nonatomic) IBOutlet UILabel *hotShowInfo;

- (IBAction)hotClick:(UIButton *)sender;


-(void)showDataWithModel:(MSModel *)model;
@end
