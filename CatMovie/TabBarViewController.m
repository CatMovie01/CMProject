//
//  TabBarViewController.m
//  CatMovie
//
//  Created by qianfeng on 15/9/22.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "TabBarViewController.h"
#import "BaseViewController.h"
#import "FindViewController.h"
@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createController];
    
}

-(void)createController
{
    
    NSArray *title=@[@"首页",@"购票",@"商城",@"发现",@"我的"];
    NSArray *images=@[@"home",@"payticket",@"store",@"discover",@"myinfo"];
    NSArray* selectedIamges=@[@"home_on",@"payticket_on",@"store_on",@"discover_on",@"myinfo_on"];
    NSArray *classNames=@[@"MovieViewController",@"TheatreViewController",@"StoreViewController",@"FindViewController",@"MeViewController"];
    self.tabBar.tintColor=RGB(30, 144, 255);
    
    NSMutableArray *vcArray=[[NSMutableArray alloc] init];
    for (int i=0; i<title.count; i++) {
       
        Class clas=NSClassFromString(classNames[i]);
        BaseViewController *vc=[[[clas class] alloc] init];
        
        if (i==3) {
            
            FindViewController* fvc=(FindViewController*)vc;
            fvc.viewControllers=[FindViewController analysisPlist];
            
            //vc
        }
         vc.title=title[i];
        UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:vc];
        [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"menu_top_bg@2x.png"] forBarMetrics:UIBarMetricsDefault];
        nav.tabBarItem.title=title[i];
        nav.tabBarItem.image=[[UIImage imageNamed:images[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nav.tabBarItem.selectedImage=[[UIImage imageNamed:selectedIamges[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
       
        [vcArray addObject:nav];
    }
    self.viewControllers=vcArray;
}

@end
