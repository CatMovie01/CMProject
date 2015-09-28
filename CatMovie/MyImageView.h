//
//  MyImageView.h
//  WallStreet
//
//  Created by qianfeng on 15/7/28.
//  Copyright (c) 2015年 yty. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyImageView;
@protocol MyImageViewDelegate <NSObject>

- (void)ImagePushViewController:(MyImageView *)imageView;

@end
@interface MyImageView : UIImageView
@property (nonatomic,weak) id<MyImageViewDelegate> delegate;
@end
