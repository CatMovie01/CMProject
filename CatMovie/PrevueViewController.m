//
//  PrevueViewController.m
//  CatMovie
//
//  Created by qianfeng on 15/9/24.
//  Copyright (c) 2015年 wangli. All rights reserved.
//
#import "TabBarViewController.h"
#import "PrevueViewController.h"
#import "PreModel.h"
#import "PreCell.h"
#import <MediaPlayer/MediaPlayer.h>
#import "CustomMP.h"
@interface PrevueViewController (){
    //播放视频
   CustomMP* _mp;
}
@property(nonatomic,strong)TabBarViewController* rankList;
@property (nonatomic,strong)MPMoviePlayerViewController *mp;
@end

@implementation PrevueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getInternetData];
    
}
- (void)createRefresh{
  
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
//点击进入播放页面   有问题
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PreModel* model=[self.dataArr objectAtIndex:indexPath.row];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    //点击跳转，播放视频
    
 
        if (_mp) {
            [_mp.moviePlayer stop];
            _mp = nil;
        }
        //注册观察者
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playBack:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
        //NSString *str = @"http://vfx.mtime.cn/Video/2015/10/03/mp4/151003140156077794.mp4";
        NSURL *url = [NSURL URLWithString:model.url];
        NSLog(@"%@",url);
        _mp = [[CustomMP alloc] initWithContentURL:url];
        //根据屏幕大小填充
        _mp.moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
    
        [self.view.window.rootViewController presentViewController:_mp animated:YES completion:nil];
        
        //准备播放
        [_mp.moviePlayer prepareToPlay];
        [_mp.moviePlayer play];
}
- (BOOL)shouldAutorotate {
    return YES;
}
//只支持竖屏 当前界面
- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}


#pragma mark - 播放视频
//点击 done 或者 播放完通知
- (void)playBack:(NSNotification *)nf {
    NSLog(@"播放完毕");
    if (_mp) {
        [_mp.moviePlayer stop];
        _mp = nil;
    }

    //删除观察者
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
}


@end
