//
//  PrevueViewController.m
//  CatMovie
//
//  Created by qianfeng on 15/9/24.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "PrevueViewController.h"
#import "PreModel.h"
#import "PreCell.h"
@interface PrevueViewController ()

@end

@implementation PrevueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getInternetData];
    
}
-(void)getInternetData{
    AFHTTPRequestOperationManager* manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFCompoundResponseSerializer serializer];
    [manager GET:PreURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary* dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        //NSLog(@"%@",dic);
        NSArray*trailers=[dic objectForKey:@"trailers"];
        for (NSDictionary* dict in trailers) {
            PreModel* model=[[PreModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];
            //NSLog(@"%@",model.videoTitle);
            [self.dataArr addObject:model];
        }
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
    return self.dataArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* CellID=@"CellID";
    PreCell* cell=[tableView dequeueReusableCellWithIdentifier:CellID];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"PreCell" owner:self options:nil]lastObject];
    }
    PreModel* model=[self.dataArr objectAtIndex:indexPath.row];
    [cell.image sd_setImageWithURL:[NSURL URLWithString:model.coverImg]];
    cell.VideoTitle.text=model.movieName;
    cell.Summary.text=model.summary;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120.f;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
