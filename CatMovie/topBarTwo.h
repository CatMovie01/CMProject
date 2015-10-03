//
//  topBarTwo.h
//  CatMovie
//
//  Created by qianfeng on 15/9/30.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kTopbarHeight 35
typedef void (^ButtonClickHandler)(NSInteger currentPage);
@interface topBarTwo : UIScrollView
@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, copy) ButtonClickHandler blockHandler;

@property (nonatomic, strong) UIView *markView;
@property (nonatomic, strong) NSMutableArray *buttons;
@end
