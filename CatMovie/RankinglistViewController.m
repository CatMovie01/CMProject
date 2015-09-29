//
//  RankinglistViewController.m
//  CatMovie
//
//  Created by qianfeng on 15/9/24.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "RankinglistViewController.h"
#import "filmModel.h"
#import "filmDetailModel.h"
#import "FilmCell.h"

@interface RankinglistViewController ()

@end

@implementation RankinglistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self getInternetData];
}
//解析的数据
-(void)getInternetData{
    AFHTTPRequestOperationManager* manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFCompoundResponseSerializer serializer];
    [manager GET:FilmURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray* arr=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        /*
         @property(nonatomic,copy)NSString*nickname;
         @property(nonatomic,copy)NSString*title;
         @property(nonatomic,copy)NSString*summary;
         @property(nonatomic,copy)NSString*userImage;
         
         @property(nonatomic,copy)NSString*retitle;
         @property(nonatomic,copy)NSString*image;
         @property(nonatomic,copy)NSString*rating;
         @property(nonatomic)NSInteger reid;
         */
        for (NSDictionary* dic in arr) {
            filmModel*model=[[filmModel alloc]init];
            model.nickname=[dic objectForKey:@"nickname"];
            model.title=[dic objectForKey:@"title"];
            model.summary=[dic objectForKey:@"summary"];
            model.userImage=[dic objectForKey:@"userImage"];
            NSDictionary* relatedObj=[dic objectForKey:@"relatedObj"];
            model.retitle=[relatedObj objectForKey:@"title"];
            model.image=[relatedObj objectForKey:@"image"];
            model.rating=[relatedObj objectForKey:@"rating"];
            model.reid=[[relatedObj objectForKey:@"reid"]integerValue];
            [self.dataArr addObject:model];
        }
        NSLog(@"%ld",self.dataArr.count);
            [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

    }];
}

#pragma mark - delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     return self.dataArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* CellID=@"CellID";
   FilmCell* cell=[tableView dequeueReusableCellWithIdentifier:CellID];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"FilmCell" owner:self options:nil]lastObject];
    }
    filmModel* model=[self.dataArr objectAtIndex:indexPath.row];
    
    cell.TitleName.text=model.title;
    //去除首尾空格
    //NSLog(@"%@",model.summary);
   NSString* str=[model.summary stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    //替换字符串
    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"\r" withString:@""];
   
    /*NSArray* arr=[model.summary componentsSeparatedByString:@"/n"];
    NSString* str=[arr lastObject];*/
    cell.summary.text=str;
    cell.nickName.text=[NSString stringWithFormat:@"%@ 评",model.nickname];
    [cell.textLabel sizeToFit];
    [cell.bigName sd_setImageWithURL:[NSURL URLWithString:model.image]];
    [cell.smallIamge sd_setImageWithURL:[NSURL URLWithString:model.userImage]];
    cell.title.text=[NSString stringWithFormat:@"-《%@》",model.retitle];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
