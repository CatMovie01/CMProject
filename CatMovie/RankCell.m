//
//  RankCell.m
//  CatMovie
//
//  Created by qianfeng on 15/9/26.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "RankCell.h"
#import "ContainerVIewController.h"
#import "RankDetailViewController.h"
@implementation RankCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)timeButton:(id)sender {
    self.rankList = (TabBarViewController *)[[[UIApplication sharedApplication] keyWindow] rootViewController];
    UINavigationController *nav = self.rankList.viewControllers[3];
    RankDetailViewController* dvc=[[RankDetailViewController alloc]init];
    nav.navigationBarHidden=NO;
    dvc.topListId=2065;
    [nav pushViewController:dvc animated:YES];
}

- (IBAction)chineseButton:(id)sender {
    self.rankList = (TabBarViewController *)[[[UIApplication sharedApplication] keyWindow] rootViewController];
    UINavigationController *nav = self.rankList.viewControllers[3];
    RankDetailViewController* dvc=[[RankDetailViewController alloc]init];
    nav.navigationBarHidden=NO;
    dvc.topListId=2066;
    [nav pushViewController:dvc animated:YES];
}

- (IBAction)gloabButton:(id)sender {
    self.rankList = (TabBarViewController *)[[[UIApplication sharedApplication] keyWindow] rootViewController];
    UINavigationController *nav = self.rankList.viewControllers[3];
    ContainerVIewController* bvc=[[ContainerVIewController alloc]init];
    bvc.viewControllers=[ContainerVIewController analysisPlist];
    nav.navigationBarHidden=NO;
    [nav pushViewController:bvc animated:YES];
}
@end
