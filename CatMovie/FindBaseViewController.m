//
//  FindBaseViewController.m
//  CatMovie
//
//  Created by qianfeng on 15/9/24.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "FindBaseViewController.h"
#import "MyImageView.h"
@interface FindBaseViewController ()<MyImageViewDelegate>{
    NSString* _className;
    MyImageView* imageView;
}
@property(nonatomic)NSInteger page;
@property (nonatomic,assign) BOOL isRefresh;
@property (nonatomic,assign) BOOL isloading;
@end

@implementation FindBaseViewController
-(void)initWithModels{
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
     self.navigationController.navigationBarHidden=YES;
}
- (void)viewWillShow {
    NSLog(@"%s", __func__);
}
- (void)viewDidLoad {
    [super viewDidLoad];
     self.page=1;
    [self initData];
    self.dataArr=[[NSMutableArray alloc]init];
    [self createTableView];
   // [self createHeaderView];
    [self createRefresh];
}
- (void)ImagePushViewController:(MyImageView *)imageView{
    
}
-(void)createTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64-49) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.dataArr = [[NSMutableArray alloc] init];
    
}
-(void)createHeaderView{
   imageView=[[MyImageView alloc]init];
    if ([_className isEqualToString:@"NewsViewController"]) {
        [self CreateimageUrl:self.imageUrl Name:self.name];
    }else if ([_className isEqualToString:@"PrevueViewController"]){
        [self CreateimageUrl:self.imageUrl1 Name:self.name1];
        UIView* view=[[UIView alloc]initWithFrame:CGRectMake(ScreenWidth-35, imageView.bottom-35,30 , 30)];
        view.backgroundColor=[UIColor colorWithPatternImage:[[UIImage imageNamed:@"v10_moviePlay@2x.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [imageView addSubview:view];
    }else if ([_className isEqualToString:@"FilmreviewViewController"]){
       
        [self CreateimageUrl:self.imageUrl2 Name:self.name2];
        
    }else{
       [self CreateimageUrl:self.imageUrl3 Name:self.name3];
    }
    
    self.tableView.tableHeaderView=imageView;
    [self.view addSubview:self.tableView];
    
   
}

//刷新
- (void)createRefresh
{
    __weak typeof(self) weakSelf = self;
    [self.tableView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (weakSelf.isRefresh) {
            return;
        }
        weakSelf.isRefresh = YES;
        weakSelf.page = 1;
        [weakSelf initData];
        
    }];
    
    [self.tableView addRefreshFooterViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (weakSelf.isloading) {
            return ;
        }
        weakSelf.isloading = YES;
        weakSelf.page++;
        [weakSelf initData];
        
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

- (void)CreateimageUrl:(NSString*)image Name:(NSString*)name{
    imageView.userInteractionEnabled=YES;

    imageView.frame=CGRectMake(0, 0, 100, ScreenHeight/3);
    
    UIView*  view=[[UIView alloc]initWithFrame:CGRectMake(0,imageView.bottom-40, ScreenWidth, 40)];
    view.backgroundColor=[UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.7];
    
    UILabel* label=[Factory createLabelWithTitle:name frame:CGRectMake(0,5, ScreenWidth, 30) textColor:[UIColor whiteColor] fontSize:18.f];
    //label
    label.textAlignment=NSTextAlignmentCenter;
    [view addSubview:label];
    [imageView addSubview:view];
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:image]];
}

-(void)initData{
     _className = NSStringFromClass([self class]);
    
    AFHTTPRequestOperationManager* mananger=[AFHTTPRequestOperationManager manager];
    mananger.responseSerializer=[AFHTTPResponseSerializer serializer];
    [mananger GET:FURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary* dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        self.news=[dic objectForKey:@"news"];
        self.review=[dic objectForKey:@"review"];
        self.toplist=[dic objectForKey:@"topList"];
        self.trailer=[dic objectForKey:@"trailer"];
        
        
        
        self.imageUrl=[self.news objectForKey:@"imageUrl"];
        self.name=[self.news objectForKey:@"title"];
        self.newsID=[[self.news objectForKey:@"newsID"]integerValue];
        
        /*
         //急速之巅
         @property(nonatomic,strong)NSString*name1;
         @property(nonatomic,strong)NSString*imageUrl1;
         @property(nonatomic)NSInteger trailerID;
         @property(nonatomic)NSInteger movieId;
         @property(nonatomic,strong)NSString*mp4Url;
         //预告片
         @property(nonatomic)NSInteger Idname;
         @property(nonatomic,strong)NSString*name2;
         //影评
         @property(nonatomic,strong)NSString*name3;
         @property(nonatomic,strong)NSString*posterUrl;
         @property(nonatomic)NSInteger reviewID;
         */
       
        self.name1=[self.trailer objectForKey:@"title"];
        self.imageUrl1=[self.trailer objectForKey:@"imageUrl"];
        self.trailerID=[[self.trailer objectForKey:@"trailerID"]integerValue];
        self.movieId=[[self.trailer objectForKey:@"movieId"]integerValue];
        self.mp4Url=[self.trailer objectForKey:@"mp4Url"];
        
        
        self.name2=[self.toplist objectForKey:@"title"];
        self.Idname=[[self.toplist objectForKey:@"id"]integerValue];
        self.imageUrl2=[self.toplist objectForKey:@"imageUrl"];
        
        self.name3=[self.review objectForKey:@"title"];
        self.reviewID=[[self.review objectForKey:@"reviewID"]integerValue];
        self.imageUrl3=[self.review objectForKey:@"imageUrl"];
       // NSLog(@"%@",self.name);
        [self createHeaderView];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

#pragma mark - delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   // return self.dataArr.count;
    return 5;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* CellID=@"CellID";
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:CellID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
    }
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
