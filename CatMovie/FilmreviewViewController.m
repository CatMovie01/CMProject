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

@end

@implementation FilmreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self getInternetData];
   
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
        NSString* CellID=@"CellID";
        UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:CellID];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
        }
        RankModel* model=self.dataArr[indexPath.row];
        cell.textLabel.text=model.topListNameCn;
        cell.textLabel.font=[UIFont systemFontOfSize:14.f];
        return cell;
    
    
  
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    return 44;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
