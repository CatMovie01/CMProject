//
//  FindBaseViewController.h
//  CatMovie
//
//  Created by qianfeng on 15/9/24.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "BaseViewController.h"
#include "ViewWillShow.h"
@interface FindBaseViewController : BaseViewController<ViewWillShow,UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)NSMutableArray* dataArr;


@property(nonatomic,strong)NSDictionary* news;
@property(nonatomic,strong)NSDictionary* trailer;
@property(nonatomic,strong)NSDictionary* review;
@property(nonatomic,strong)NSDictionary* toplist;

//news
@property(nonatomic,strong)NSString*imageUrl;
@property(nonatomic,copy)NSString* name;
@property(nonatomic)NSInteger newsID;
//急速之巅
@property(nonatomic,strong)NSString*name1;
@property(nonatomic,strong)NSString*imageUrl1;
@property(nonatomic)NSInteger trailerID;
@property(nonatomic)NSInteger movieId;
@property(nonatomic,strong)NSString*mp4Url;
//预告片
@property(nonatomic)NSInteger Idname;
@property(nonatomic,strong)NSString*name2;
@property(nonatomic,strong)NSString*imageUrl2;
//影评
@property(nonatomic,strong)NSString*name3;
@property(nonatomic,strong)NSString*imageUrl3;
@property(nonatomic)NSInteger reviewID;

//-(void)createView;
- (void)createRefresh;
-(void)initData;
-(void)initWithModels;
- (void)CreateimageUrl:(NSString*)image Name:(NSString*)name;
- (void)endRefresh;
@end
