//
//  CustomMP.m
//  CustomMPMovieViewPlayerController
//
//  Created by LZXuan on 15-1-13.
//  Copyright (c) 2015年 LZXuan. All rights reserved.
//

#import "CustomMP.h"

@interface CustomMP ()
{
    NSTimer *_timer;
}
@end

@implementation CustomMP
- (void)dealloc {
    //要销毁定时器
    if ([_timer isValid]) {
        [_timer invalidate];
        _timer = nil;
    }
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//允许代码控制  屏幕视图控制器视图自动旋转
- (BOOL)shouldAutorotate {
    return YES;
}
//只支持横屏
- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([_timer isValid]) {
        return;
    }
    //启动定时器  会起一个线程 进行每隔1s 进行调度一次 定时器的实现要依赖于NSRunloop
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
}

- (void)updateTimer:(NSTimer *) timer {
    //进度
    NSLog(@"progress:%f/%f",self.moviePlayer.currentPlaybackTime,self.moviePlayer.duration);
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if ([_timer isValid]) {
        [_timer invalidate];
        _timer = nil;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
