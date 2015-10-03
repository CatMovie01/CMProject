//
//  VideoBarView.m
//  PicketKitchen
//
//  Created by lzxuan on 15/9/9.
//  Copyright (c) 2015年 lzxuan. All rights reserved.
//

#import "VideoBarView.h"

@implementation VideoBarView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createViews];
    }
    return self;
}
+ (VideoBarView *)videoWithFrame:(CGRect)frame material:(PlayVideoBlock)material production:(PlayVideoBlock)production {
    VideoBarView *videoView = [[VideoBarView alloc] initWithFrame:frame];
    //保存block
    videoView.material = material;
    
    return videoView;
}

- (void)createViews {
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed: @"详情-视频底"]];
    CGFloat width = self.frame.size.width/3;
    CGFloat height = self.frame.size.height;
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(width, 0, width, height)];
    //设置内容模式 按照原有大小居中
    imageview.contentMode = UIViewContentModeScaleAspectFit ;
    
    imageview.image = [UIImage imageNamed: @"详情-同步视频"];
    [self addSubview:imageview];
    NSArray *titles = @[@"材料准备",@"制作过程"];
    NSArray *images = @[@"详情-视频左-选",@"详情-视频右-选"];
    NSArray *images2 = @[@"详情-视频标志",@"详情-视频标志"];
    
    for (NSInteger i = 0; i < titles.count; i++) {
        
        UIButton *button = [Factory creatButtonWithFrame:CGRectMake(i*(2*width), 0, width, height) target:self sel:@selector(btnClick:) tag:101+i image:nil title:titles[i]];
        
        [button setImage:[UIImage imageNamed:images2[i]] forState:UIControlStateNormal];
        
        [button setBackgroundImage:[UIImage imageNamed:images[i]] forState:UIControlStateHighlighted];
        
        [self addSubview:button];
    }
}
- (void)btnClick:(UIButton *)button {
            if (self.material) {
                self.material();//回调 block 进行 界面跳转 播放视频
            }
    
}


@end
