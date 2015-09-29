//
//  HeaderNewsCell.m
//  CatMovie
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "HeaderNewsCell.h"
#import "BillboardViewController.h"
@implementation HeaderNewsCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)ChinaSort:(UIButton *)sender {
}

- (IBAction)globalSort:(UIButton *)sender {
    NSLog(@"haha");
    self.NewsView = (TabBarViewController *)[[[UIApplication sharedApplication] keyWindow] rootViewController];
    UINavigationController *nav = self.NewsView.viewControllers[3];
    BillboardViewController* bvc=[[BillboardViewController alloc]init];
    nav.navigationBarHidden=NO;
    [nav pushViewController:bvc animated:YES];
}
@end
