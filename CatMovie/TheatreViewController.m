//
//  TheatreViewController.m
//  CatMovie
//
//  Created by qianfeng on 15/9/22.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "TheatreViewController.h"
#import "hotCell.h"
#import "HotModel.h"
#import "MMProgressHUD.h"
#import "CinemaViewController.h"

#define kHotMovieURL @"http://api.m.mtime.cn/Showtime/LocationMovies.api?locationId=489"

@interface TheatreViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    //分段控制器
    UISegmentedControl *_segmentControl;
    //分段标题
    NSArray *_titleItems;
    
    AFHTTPRequestOperationManager *_manager;
}
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UITableView *tableView;

//数据源
@property (nonatomic,strong) NSMutableArray *data;

@end

@implementation TheatreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    
//    CGFloat version=[[[UIDevice currentDevice] systemVersion] floatValue];
//    if(version>8.0)
//    {
//       
//    }
    
    
    [self initData];
    [self createView];
    
}
-(void)initData
{
    [self getNetData];
}
-(void)createView
{
    [self creaeteSegment];
    [self createTableView];
}
#pragma  mark - 获取网络数据
-(void)getNetData
{
    self.data=[[NSMutableArray alloc] init];
    _manager=[AFHTTPRequestOperationManager manager];
    _manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    __weak typeof(self) weakSelf=self;
    
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleShrink];
    [MMProgressHUD showWithTitle:@"加载数据" status:@"拼命加载中"];
    [_manager GET:kHotMovieURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if(responseObject)
        {
           
            NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            NSArray *arr=dict[@"ms"];
            for (NSDictionary *dic in arr) {
                MSModel *model=[[MSModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [weakSelf.data addObject:model];
            }
            
            //NSLog(@"%@",weakSelf.leftData);
            [weakSelf.tableView reloadData];
        }
        [MMProgressHUD dismissWithSuccess:@"加载数据" title:@"成功"];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MMProgressHUD dismissWithError:@"加载数据" title:@"失败"];
    }];
}
#pragma  mark - 创建导航处的分区视图
-(void)creaeteSegment
{
    _titleItems=@[@"热映",@"影院"];
    _segmentControl=[[UISegmentedControl alloc] initWithItems:_titleItems];
    _segmentControl.tintColor=[UIColor whiteColor];
    //segmentControl.segmentedControlStyle=UISegmentedControlStyleBar;
    _segmentControl.momentary=YES;
    CGRect frame=CGRectZero;
    frame.size.height=30;
    frame.size.width=80;
    _segmentControl.frame=frame;
    _segmentControl.selectedSegmentIndex=0;
    self.navigationItem.titleView=_segmentControl;
    [_segmentControl addTarget:self action:@selector(segmentControlAction:) forControlEvents:UIControlEventValueChanged];
}
#pragma  mark - segment触发行为
-(void)segmentControlAction:(UISegmentedControl *)segment
{
    CinemaViewController *cinema=[[CinemaViewController alloc]init ];
    self.navigationController.viewControllers=@[cinema];
    NSInteger a=_segmentControl.selectedSegmentIndex;
    NSString *str=[[NSString alloc]initWithFormat:@"%ld",a];
    if ([str isEqualToString:@"0"]) {
        
        [self.navigationController pushViewController:cinema animated:NO];
    }
}

#pragma  mark - 创建tableView
-(void)createTableView
{
    self.tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-49-64) style:UITableViewStylePlain];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.view addSubview:self.tableView];
}

#pragma  mark - 实现tableview的协议方法<UITableViewDelegate,UITableViewDataSource>
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *leftCell=@"leftCell";
    hotCell *cell=[tableView dequeueReusableCellWithIdentifier:leftCell];
    if(cell==nil)
    {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"hotCell" owner:nil options:nil] lastObject];
    }
    MSModel *model=self.data[indexPath.row];
    [cell showDataWithModel:model];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
}



@end
