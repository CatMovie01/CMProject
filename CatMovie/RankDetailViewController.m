//
//  RankDetailViewController.m
//  CatMovie
//
//  Created by qianfeng on 15/10/3.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "RankDetailViewController.h"
#import "PersonModel.h"
#import "RankListCell.h"
#import "MoviesModel.h"
#import "RankListTwoCell.h"
@interface RankDetailViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSArray*movies;
    NSArray*persons;
    NSString* url;
}
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)NSMutableArray*dataArr;
@property(nonatomic,copy)NSString* name;
@property(nonatomic,copy)NSString* summary;

@end

@implementation RankDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArr=[[NSMutableArray alloc]init];
    [self initData];
    [self createTableView];
    self.view.backgroundColor=[UIColor whiteColor];
}
-(void)createTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-49-64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    //self.tableView.estimatedRowHeight = 300;
}
-(void)initData{
    if (self.topListId==2066||self.topListId==2065) {
     url=[NSString stringWithFormat:RankDetailURL,self.topListId];
    }else{
      url=[NSString stringWithFormat:RankDeURL,self.topListId];
    }
    
    
    
    AFHTTPRequestOperationManager* manger=[AFHTTPRequestOperationManager manager];
    manger.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manger GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary* dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSDictionary* topList=[dic objectForKey:@"topList"];
        
        self.name=[topList objectForKey:@"name"];
        self.summary=[topList objectForKey:@"summary"];
         movies=[dic objectForKey:@"movies"];
        if (movies) {
            for (NSDictionary* dict in movies) {
                MoviesModel* model=[[MoviesModel alloc]init];
                [model setValuesForKeysWithDictionary:dict];
                 [self.dataArr addObject:model];
            }
           
        }
        persons=[dic objectForKey:@"persons"];
        if (persons) {
            for (NSDictionary* dict in persons) {
                PersonModel* model=[[PersonModel alloc]init];
                [model setValuesForKeysWithDictionary:dict];
                [self.dataArr addObject:model];
            }
        }
       
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (persons) {
        static NSString* CellID=@"Cell";
        RankListCell* cell=[tableView dequeueReusableCellWithIdentifier:CellID];
        if (cell==nil) {
            cell=[[[NSBundle mainBundle]loadNibNamed:@"RankListCell" owner:self options:nil]lastObject];
        }
        PersonModel* model=[self.dataArr objectAtIndex:indexPath.row];
        [cell.image sd_setImageWithURL:[NSURL URLWithString:model.posterUrl]];
        cell.name.text=model.nameCn;
        
        cell.EnName.text=model.nameEn;
        
        cell.sumary.text=[NSString stringWithFormat:@"%@,%@年 %@(%@)",model.sex,model.birthYear,model.birthDay,model.birthLocation];
        cell.summary.text=model.summary;
        
        if (model.rankNum.integerValue<10) {
            cell.rankNum.text=[NSString stringWithFormat:@"0%@",model.rankNum];
        }else{
            cell.rankNum.text=model.rankNum.stringValue;
        }
        
        return cell;
    }else{
        static NSString* Cell=@"CellID";
         RankListTwoCell* cell=[tableView dequeueReusableCellWithIdentifier:Cell];
        if (cell==nil) {
            cell=[[[NSBundle mainBundle]loadNibNamed:@"RankListTwoCell" owner:self options:nil]lastObject];
        }
        MoviesModel* model=[self.dataArr objectAtIndex:indexPath.row];
        [cell.image sd_setImageWithURL:[NSURL URLWithString:model.posterUrl]];
        cell.name.text=model.name;
        
        cell.EnName.text=model.nameEn;
        cell.rating.text=[model.rating stringValue];
        cell.director.text=model.director;
        cell.actor.text=model.actor;
        cell.remark.text=model.remark;
        if (model.rankNum.integerValue<10) {
            cell.rankNum.text=[NSString stringWithFormat:@"0%@",model.rankNum];
        }else{
            cell.rankNum.text=model.rankNum.stringValue;
        }
        return cell;
    }
    
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (persons) {
        return 150;
    }else{
        return 175;
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



@end
