//
//  BillboardViewController.m
//  CatMovie
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "BillboardViewController.h"
#import "RankDetailModel.h"
#import "RankDetailCell.h"
@interface BillboardViewController ()<UITableViewDataSource,UITableViewDelegate>{
      NSString *_className;
}

@property(nonatomic,strong)NSMutableArray*dataArr;
@property(nonatomic,copy)NSString* name;
@property(nonatomic,copy)NSString* summary;

@end

@implementation BillboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     _className = NSStringFromClass([self class]);
    self.view.backgroundColor=[UIColor whiteColor];
    //self.view.backgroundColor=RandomColor;
    [self valuation];
    [self initData];
    [self createTableView];
}
-(void)createTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-49-64-20) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    //self.tableView.estimatedRowHeight = 300;
}
- (void)valuation
{
    
    self.dataArr = [[NSMutableArray alloc] init];
    if ([_className isEqualToString:@"ABilldViewController"]) {
        
        self.url = [NSString stringWithFormat:RankAURL];
    }else if([_className isEqualToString:@"CBilldViewController"])
    {
        self.url = [NSString stringWithFormat:RankCURL];
    }else if ([_className isEqualToString:@"XBilldViewController"])
    {
        self.url = [NSString stringWithFormat:RankXURL];
    }else if ([_className isEqualToString:@"TBilldViewController"])
    {
        self.url = [NSString stringWithFormat:RankTURL];
    }else if ([_className isEqualToString:@"DogBilldViewController"]){
        self.url = [NSString stringWithFormat:RankDURL];
    }else
    {
        self.url = [NSString stringWithFormat:RankKURL];
    }

}
-(void)initData{
    AFHTTPRequestOperationManager* manger=[AFHTTPRequestOperationManager manager];
    manger.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manger GET:self.url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary* dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSDictionary* topList=[dic objectForKey:@"topList"];
      
            self.name=[topList objectForKey:@"name"];
            self.summary=[topList objectForKey:@"summary"];
        
        NSArray* movies=[dic objectForKey:@"movies"];
        for (NSDictionary* dict in movies) {
            RankDetailModel* model=[[RankDetailModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];
            [self.dataArr addObject:model];
        }
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* CellID=@"CellID";
    RankDetailCell* cell=[tableView dequeueReusableCellWithIdentifier:CellID];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"RankDetailCell" owner:self options:nil]lastObject];
    }
    RankDetailModel* model=[self.dataArr objectAtIndex:indexPath.row];
    [cell.image sd_setImageWithURL:[NSURL URLWithString:model.posterUrl]];
    cell.name.text=model.name;
    cell.actor.text=[NSString stringWithFormat:@"导演: %@",model.actor];
    cell.timer.text=model.releaseDate;
    cell.EnName.text=model.nameEn;
    cell.Director.text=[NSString stringWithFormat:@"主演: %@",model.director];
    model.weekBoxOffice = [model.weekBoxOffice stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    cell.weekBoxOffice.text=model.weekBoxOffice;
  
    model.totalBoxOffice=[model.totalBoxOffice stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    cell.totalBoxOffice.text=model.totalBoxOffice;
    if (model.rankNum.integerValue<10) {
       cell.rankNum.text=[NSString stringWithFormat:@"0%@",model.rankNum];
    }else{
        cell.rankNum.text=model.rankNum.stringValue;
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 175;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.summary;
}


@end
