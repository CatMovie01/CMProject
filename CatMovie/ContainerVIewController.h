//
//  ContainerVIewController.h
//  CatMovie
//
//  Created by qianfeng on 15/9/30.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContainerVIewController : UIViewController
@property(nonatomic,strong)NSArray* viewControllers;
-(id)initWithViewControllers:(NSArray*)viewControllers;
+(NSArray *)analysisPlist;
@end
