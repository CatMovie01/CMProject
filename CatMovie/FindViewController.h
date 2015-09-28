//
//  FindViewController.h
//  CatMovie
//
//  Created by qianfeng on 15/9/22.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "BaseViewController.h"
#import "FindBaseViewController.h"
@interface FindViewController : BaseViewController
@property(nonatomic,strong)NSArray* viewControllers;
-(id)initWithViewControllers:(NSArray*)viewControllers;
+(NSArray *)analysisPlist;
@end
