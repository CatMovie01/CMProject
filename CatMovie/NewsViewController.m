//
//  NewsViewController.m
//  CatMovie
//
//  Created by qianfeng on 15/9/24.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsModel.h"
#import "newsList.h"
#import "FourModel.h"
#import "NewsCell.h"
#import "SecondNewsCell.h"
#import "HeaderNewsCell.h"
#import "BillboardViewController.h"
@interface NewsViewController ()
@property(nonatomic)NSInteger page;
@property (nonatomic,assign) BOOL isRefresh;
@property (nonatomic,assign) BOOL isloading;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // [super initData];
    self.page=1;
    [self initNetData];
    //[self createHeaderView];
   
}

- (void)createRefresh
{
    __weak typeof(self) weakSelf = self;
    [self.tableView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (weakSelf.isRefresh) {
            return;
        }
        weakSelf.isRefresh = YES;
        weakSelf.page = 1;
        [weakSelf getData];
        
    }];
    [self.tableView addRefreshFooterViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (weakSelf.isloading) {
            return ;
        }
        weakSelf.isloading = YES;
        weakSelf.page++;
        [weakSelf getData];
        
    }];
}
- (void)endRefresh
{
    if (self.isRefresh) {
        self.isRefresh = NO;
        [self.tableView headerEndRefreshingWithResult:JHRefreshResultNone];
    }
    if (self.isloading) {
        self.isloading = NO;
        [self.tableView footerEndRefreshing];
    }
}
-(void)createView{
    [self createRefresh];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64-49) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
     [self CreateimageUrl:self.imageUrl Name:self.name];
    
}
/*-(void)createHeaderView{
     NSInteger f=self.newsID;
    NSLog(@"%ld",f);
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64-49) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.dataArr = [[NSMutableArray alloc] init];
    
    
       UIImageView* View=[[UIImageView alloc]init];
       NSLog(@"image=%@",self.imageUrl);
       [View sd_setImageWithURL:[NSURL URLWithString:self.imageUrl]];
       View.frame=CGRectMake(0, 0, 100, ScreenHeight/3);
       //
    UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0,View.bottom-40, ScreenWidth, 40)];
    view.backgroundColor=[UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.7];
    
    UILabel*label=[Factory createLabelWithTitle:self.name frame:CGRectMake(0,5, ScreenWidth, 30) textColor:[UIColor whiteColor] fontSize:18.f];
    //label
    label.textAlignment=NSTextAlignmentCenter;
    [view addSubview:label];
    [View addSubview:view];
      self.tableView.tableHeaderView=View;
      [self.view addSubview:self.tableView];
}*/


-(void)initNetData{
   
    [super initData];
    [self getData];
}
-(void)getData{
    NSString* url=[NSString stringWithFormat:NewsURL,self.page];
    AFHTTPRequestOperationManager*mananger=[AFHTTPRequestOperationManager manager];
    mananger.responseSerializer=[AFHTTPResponseSerializer serializer];
    [mananger GET:url parameters:Nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
       //newsList* model=[[newsList alloc]initWithData:responseObject error:nil];
        //NSLog(@"%@",model);
        
        NSDictionary* dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:Nil];
         NSArray* newsList=[dic objectForKey:@"newsList"];
         for (NSDictionary* dict in newsList) {
            NewsModel* model=[[NewsModel alloc]init];
            model.image=[dict objectForKey:@"image"];
            model.title=[dict objectForKey:@"title"];
            model.title2=[dict objectForKey:@"title2"];
            model.publishTime=[self dateStringFromNumberTimer:[dict objectForKey:@"publishTime"]];
            //model.publishTime=[dict objectForKey:@"publishTime"]string;
            model.commentCount=[dict objectForKey:@"commentCount"];
             NSArray * images = [dict objectForKey:@"images"];
             if (images) {
                 NSMutableArray * imagesModel = [[NSMutableArray alloc] init];
                 for (NSDictionary* obj in images) {
                     FourModel* fmodel=[[FourModel alloc]init];
                     fmodel.gId=[[obj objectForKey:@"gId"]integerValue];
                     fmodel.desc=[obj objectForKey:@"desc"];
                     fmodel.url1=[obj objectForKey:@"url1"];
                     [imagesModel addObject:fmodel];
                 }
                 model.images = imagesModel;
             }
             [self.dataArr addObject:model];
             [self.tableView reloadData];
             //NSLog(@"%@",model.images);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
//转化时间
- (NSString *)dateStringFromNumberTimer:(NSString *)timerStr {
  
  
    //转化为Double
    double t = [timerStr doubleValue];
    double t1=t-8*60*60;
    //计算出距离1970的NSDate
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:t1];
    //转化为 时间格式化字符串
    
    
    /*NSTimeInterval spaceTime = [date timeIntervalSinceDate:[NSDate date]];
    
    NSDate *spaceDate = [NSDate dateWithTimeIntervalSince1970:spaceTime];*/
    NSDateFormatter *df = [[NSDateFormatter alloc] init] ;
    df.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    //转化为 时间字符串
    //df.dateFormat = @"d天H小时m分钟之前";
    
    return [df stringFromDate:date];
    
}


//#pragma mark - delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
     if (indexPath.section==0) {
        return 70;
    }else{
        
            return 108;
        
    }
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else{
        return self.dataArr.count;
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
         NSString* Cell=@"Cell";
        HeaderNewsCell* cell=[tableView dequeueReusableCellWithIdentifier:Cell];
        if (cell==nil) {
             cell=[[[NSBundle mainBundle]loadNibNamed:@"HeaderNewsCell" owner:self options:nil]lastObject];
        }
        return cell;
    }else{
        //self.tableView.estimatedRowHeight = 100;
        
        NewsModel* model=[self.dataArr objectAtIndex:indexPath.row];
        if (model.images) {
            NSString* CellID=@"identity";
         NewsCell* cell=[tableView dequeueReusableCellWithIdentifier:CellID];
         if (cell==nil) {
         
         cell=[[[NSBundle mainBundle]loadNibNamed:@"NewsCell" owner:self options:nil]lastObject];
         
         }
         cell.title.text=model.title;
         cell.commit.text=[NSString stringWithFormat:@"%@评论",[model.commentCount stringValue]];
         cell.timer.text=model.publishTime;
         
         FourModel* fmodel=model.images[0];
         [cell.image sd_setImageWithURL:[NSURL URLWithString:fmodel.url1]];
                    FourModel*Hmodel=model.images[1];
                      [cell.image2 sd_setImageWithURL:[NSURL URLWithString:Hmodel.url1]];
                     FourModel*Jmodel=model.images[2];
                     [cell.image3 sd_setImageWithURL:[NSURL URLWithString:Jmodel.url1]];
         return cell;
         }else{
              NSString* CellID=@"CellID";
        SecondNewsCell* cell=[tableView dequeueReusableCellWithIdentifier:CellID];
        if (cell==nil) {
            cell=[[[NSBundle mainBundle]loadNibNamed:@"SecondNewsCell" owner:self options:nil]lastObject];
        }
        cell.title.text=model.title;
        cell.commit.text=[NSString stringWithFormat:@"%@评论",[model.commentCount stringValue]];
        cell.timer.text=model.publishTime;
        
        cell.title2.text=model.title2;
        
        [cell.image sd_setImageWithURL:[NSURL URLWithString:model.image]];
        return cell;
         }
    }
   
   
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
  
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
