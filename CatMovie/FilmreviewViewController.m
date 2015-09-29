//
//  FilmreviewViewController.m
//  CatMovie
//
//  Created by qianfeng on 15/9/24.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "FilmreviewViewController.h"
#import "RankCell.h"
@interface FilmreviewViewController ()
@property(nonatomic,strong)NSMutableArray*dataArry;
@end

@implementation FilmreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArry=[[NSMutableArray alloc]init];
    [self getInternetData];
    [self createView];
}
-(void)createView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64-49) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self CreateimageUrl:self.imageUrl2 Name:self.name2];
}
-(void)getInternetData{
    AFHTTPRequestOperationManager* manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manager GET:RankURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary*dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSArray*topLists=[dic objectForKey:@"topLists"];
        //  NSLog(@"%@",topLists);
        for (NSDictionary*dict in topLists) {
            RankModel* model=[[RankModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];
           // NSLog(@"%@",model.summary);
            [self.dataArry addObject:model];
        }
        [self.tableView reloadData];
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
