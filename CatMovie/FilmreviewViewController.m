//
//  FilmreviewViewController.m
//  CatMovie
//
//  Created by qianfeng on 15/9/24.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "FilmreviewViewController.h"
#import "RankCell.h"
#import "RankDetailViewController.h"
#import "TabBarViewController.h"
@interface FilmreviewViewController (){
    UIImageView* imageView;
}
@property(nonatomic,strong)NSMutableArray*dataArry;
@property(nonatomic)NSInteger page;
@property (nonatomic,assign) BOOL isRefresh;
@property (nonatomic,assign) BOOL isloading;

@end

@implementation FilmreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArry=[[NSMutableArray alloc]init];
   // self.page=1;
    
    //[self createView];
   
}



-(void)createView{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64-49) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    // UIImageView*  imageView=[[UIImageView alloc]init];
    [self CreateimageUrl:self.imageUrl2 Name:self.name2];
}
-(void)initData{
    [super initData];
    [self getInternetData];
}
/*- (void)CreateimageUrl:(NSString*)image Name:(NSString*)name{
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
     self.tableView.tableHeaderView=imageView;
}*/

-(void)getInternetData{
    NSString* url=[NSString stringWithFormat:RankURL,self.page];
    AFHTTPRequestOperationManager* manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary*dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSArray*topLists=[dic objectForKey:@"topLists"];
        //  NSLog(@"%@",topLists);
        if (self.page==1) {
            [self.dataArry removeAllObjects];
        }
        for (NSDictionary*dict in topLists) {
            RankModel* model=[[RankModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];
           // NSLog(@"%@",model.summary);
            [self.dataArry addObject:model];
            
        }
        [self.tableView reloadData];
        [self endRefresh];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else{
      return self.dataArry.count;
    }
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
         NSString* CellID=@"CellID";
        RankCell* cell=[tableView dequeueReusableCellWithIdentifier:CellID];
        if (cell==nil) {
            cell=[[[NSBundle mainBundle]loadNibNamed:@"RankCell" owner:self options:nil]lastObject];
        }
        return cell;
    }else {
         NSString* CellID=@"Cell";
        UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:CellID];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
        }
        RankModel* model=self.dataArry[indexPath.row];
        cell.textLabel.text=model.topListNameCn;
        cell.textLabel.font=[UIFont systemFontOfSize:14.f];
        return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        
        return 100;
    }else{
      return 44;
    }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    RankModel* model=[self.dataArry objectAtIndex:indexPath.row];
    if (indexPath.section==1) {
        TabBarViewController* tvc=(TabBarViewController*)[[[UIApplication sharedApplication]keyWindow]rootViewController];
        UINavigationController *nav = tvc.viewControllers[3];
        RankDetailViewController* dvc=[[RankDetailViewController alloc]init];
        dvc.topListId=model.id;
        nav.navigationBarHidden=NO;
        [nav pushViewController:dvc animated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
