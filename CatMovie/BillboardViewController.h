//
//  BillboardViewController.h
//  CatMovie
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BillboardViewController : UIViewController
@property (nonatomic,copy) NSString *url;

@property(nonatomic,strong)UITableView* tableView;
- (void)valuation;
@end
