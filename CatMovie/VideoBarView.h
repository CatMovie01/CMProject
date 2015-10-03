//
//  VideoBarView.h
//  PicketKitchen
//
//  Created by lzxuan on 15/9/9.
//  Copyright (c) 2015年 lzxuan. All rights reserved.
//

#import <UIKit/UIKit.h>
//1.定义 block
//委托 上级 界面 进行 模态跳转播放视频
typedef void (^PlayVideoBlock) (void);
@interface VideoBarView : UIView
//传入block
+ (VideoBarView *)videoWithFrame:(CGRect)frame material:(PlayVideoBlock)material production:(PlayVideoBlock)production;
//保存block
@property (nonatomic,copy) PlayVideoBlock material;


@end
