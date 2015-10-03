//
//  CinemaViewController.m
//  CatMovie
//
//  Created by qianfeng on 15/9/30.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "CinemaViewController.h"
#import "TheatreViewController.h"
#import "LocationInfo.h"
#import "CinemaModel.h"
#import "CinemaCell.h"
#import <CoreLocation/CoreLocation.h>


#define kCinemaURL @"http://api.m.mtime.cn/OnlineLocationCinema/OnlineCinemasByCity.api?"

@interface CinemaViewController ()<UITableViewDelegate,UITableViewDataSource,LocationInfoDelegate>

//
@property (nonatomic,strong) UIBarButtonItem *leftButton;


//城市 代码
@property (nonatomic,copy) NSString *locationId;
@property (nonatomic,copy) NSString *locationName;
@property (nonatomic,strong) LocationInfo *location;

@property (nonatomic,strong) UISegmentedControl *segmentControl;
@property (nonatomic,strong) NSArray *titleItems;

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *data;

@end

@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    //获取城市 代码
    [self getCityCode];
    [self createView];
}
-(void)getCityCode
{
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleShrink];
    [MMProgressHUD showWithTitle:@"定位中" status:@""];
    
    self.location= [LocationInfo SharedCity];
    self.location.delegate=self;
    
}
-(void)UpdateCityCinema:(LocationInfo *)info
{
    self.locationId=[self.location.cityCode stringValue];
    self.locationName=info.cityName;
        
    [self initData];
}

-(void)initData
{
    self.data=[[NSMutableArray alloc] init];
    __weak typeof(self) weakSelf=self;
    
    
    
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manager GET:kCinemaURL parameters:[NSDictionary dictionaryWithObjectsAndKeys:self.locationId,@"locationId", nil] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if(responseObject)
        {
            NSArray *arrData=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            for (NSDictionary *dic in arrData) {
                CinemaModel *model=[[CinemaModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                
                [weakSelf.data addObject:model];
            }
            weakSelf.leftButton.title=weakSelf.locationName;
            [weakSelf.tableView reloadData];
        }
        [MMProgressHUD dismissWithSuccess:@"定位" title:@"成功"];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MMProgressHUD dismissWithError:@"定位" title:@"失败"];
    }];
}

-(void)createView
{
    self.leftButton=[[UIBarButtonItem alloc] init];
    [self.leftButton setTitle:@""];
    [self.leftButton setTintColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem=self.leftButton;
    
    
    
    [self createSegmentControl];
    [self createTableView];
    
    
    
}
#pragma mark - 创建分段控制器
-(void)createSegmentControl
{
    _titleItems=@[@"热映",@"影院"];
    _segmentControl=[[UISegmentedControl alloc]initWithItems:_titleItems];
    _segmentControl.tintColor=[UIColor whiteColor];
    CGRect frame=CGRectZero;
    frame.size.height=30;
    frame.size.width=80;
    _segmentControl.frame=frame;
    _segmentControl.selectedSegmentIndex=1;
    self.navigationItem.titleView=_segmentControl;
    [_segmentControl addTarget:self action:@selector(segmentControlAction:) forControlEvents:UIControlEventValueChanged];
}
-(void)segmentControlAction:(UISegmentedControl *)sender
{
    TheatreViewController *theare=[[TheatreViewController alloc]init];
    self.navigationController.viewControllers=@[theare];
    NSInteger a=_segmentControl.selectedSegmentIndex;
    NSString *str=[[NSString alloc]initWithFormat:@"%ld",a];
    if ([str isEqualToString:@"1"])
    {
        [self.navigationController pushViewController:theare animated:YES];
    }
}
#pragma mark - 创建tableview
-(void)createTableView
{
    self.tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64-49) style:UITableViewStylePlain];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    self.tableView.estimatedRowHeight=100;    
    
    [self.view addSubview:self.tableView];
}


#pragma mark - delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier=@"CinemaCell";
    CinemaCell *cell=[tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"CinemaCell" owner:nil options:nil] lastObject];
    }
    CinemaModel *model=self.data[indexPath.row];
    
    cell.cinameName.text=model.cinameName;
    cell.address.text=model.address;
    cell.minPrice.text=[NSString stringWithFormat:@"￥%d起",[model.minPrice intValue]/100];
        
    //[cell showWithCinema:model];
    return cell;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
