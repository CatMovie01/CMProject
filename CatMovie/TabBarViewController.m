//
//  TabBarViewController.m
//  CatMovie
//
//  Created by qianfeng on 15/9/22.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "TabBarViewController.h"
#import "BaseViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createController];
    
}

-(void)createController
{
    NSArray *title=@[@"电影",@"影院",@"发现",@"我的"];
    NSArray *images=@[@"tab_my_normal",@"tab_my_normal",@"tab_my_normal",@"tab_my_normal"];
    NSArray *classNames=@[@"MovieViewController",@"TheatreViewController",@"FindViewController",@"MeViewController"];
    
    NSMutableArray *vcArray=[[NSMutableArray alloc] init];
    for (int i=0; i<title.count; i++) {
        Class clas=NSClassFromString(classNames[i]);
        BaseViewController *vc=[[[clas class] alloc] init];
        
        UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:vc];
        
        nav.tabBarItem.title=title[i];
        nav.tabBarItem.image=[[UIImage imageNamed:images[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [vcArray addObject:nav];
    }
    self.viewControllers=vcArray;
}

@end
