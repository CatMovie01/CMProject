//
//  FindViewController.m
//  CatMovie
//
//  Created by qianfeng on 15/9/22.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "FindViewController.h"
#import "Topbar.h"
#import "ViewWillShow.h"
@interface FindViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView* scrollView;
@property(nonatomic,strong)Topbar*topbar;
@property(nonatomic,assign)NSInteger currentPage;

@end

@implementation FindViewController
+(NSArray *)analysisPlist
{
    NSMutableArray *vcMarr = [[NSMutableArray alloc] init];
    NSArray *title=@[@"新闻",@"预告片",@"排行榜",@"影评"];
    NSArray* ClassController=@[@"NewsViewController",@"PrevueViewController",@"FilmreviewViewController",@"RankinglistViewController"];
    for (int i=0;i<4;i++) {
         Class cls = NSClassFromString(ClassController[i]);
        FindBaseViewController *newController = [[[cls class] alloc]init];
          newController.title = title[i];
        [vcMarr addObject:newController];
    }
    return vcMarr;
}
-(id)initWithViewControllers:(NSArray *)viewControllers{
    if (self=[super init]) {
        _viewControllers=viewControllers;
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
      self.automaticallyAdjustsScrollViewInsets = NO;
    self.hidesBottomBarWhenPushed=NO;
    self.navigationController.navigationBarHidden=YES;
}
- (Topbar *)topbar {
    if (!_topbar) {
        _topbar = [[Topbar alloc] initWithFrame:CGRectMake(0, [[UIApplication sharedApplication] statusBarFrame].size.height-20, CGRectGetWidth(self.view.frame), kTopbarHeight)];
        _topbar.backgroundColor = [UIColor blueColor];
        
        __block FindViewController *_self = self;
        _topbar.blockHandler = ^(NSInteger currentPage) {
            [_self setCurrentPage:currentPage];
        };
        [self.view addSubview:_topbar];
    }
    return _topbar;
}

// overwrite getter of property: scrollView
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.topbar.frame), CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-kTopbarHeight)];
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.delegate                       = self;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator   = NO;
        _scrollView.bounces                        = NO;
        _scrollView.pagingEnabled                  = YES;
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

// overwrite setter of property: viewControllers
- (void)setViewControllers:(NSArray *)viewControllers {
    _viewControllers = [NSArray arrayWithArray:viewControllers];
    CGFloat x = 0.0;
    for (UIViewController *viewController in _viewControllers) {
        [viewController willMoveToParentViewController:self];
        viewController.view.frame = CGRectMake(x, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        [self.scrollView addSubview:viewController.view];
        [viewController didMoveToParentViewController:self];
        
        x += CGRectGetWidth(self.scrollView.frame);
        _scrollView.contentSize   = CGSizeMake(x, _scrollView.frame.size.width);
    }
    
    self.topbar.titles = [_viewControllers valueForKey:@"title"];
}

- (void)setCurrentPage:(NSInteger)currentPage {
    _currentPage = currentPage;
    [self.scrollView setContentOffset:CGPointMake(_currentPage*_scrollView.frame.size.width, 0) animated:NO]; //
}

- (void)layoutSubViews
{
    CGFloat x = 0.0;
    for (UIViewController *viewController in self.viewControllers) {
        viewController.view.frame = CGRectMake(x, 0, _scrollView.frame.size.width, _scrollView.frame.size.height);
        x += CGRectGetWidth(self.scrollView.frame);
    }
    self.scrollView.contentSize   = CGSizeMake(x, _scrollView.frame.size.width);
    //self.scrollView.contentOffset = CGPointMake(_scrollView.frame.size.width, 0);
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger currentPage = _scrollView.contentOffset.x / _scrollView.frame.size.width;
    _topbar.currentPage   = currentPage;
    _currentPage = currentPage;
    [self callbackSubViewControllerWillShow];
}

// call back if scroll to special view controller
- (void)callbackSubViewControllerWillShow {
    UIViewController<ViewWillShow> *controller = [self.viewControllers objectAtIndex:self.currentPage];
    if ([controller conformsToProtocol:@protocol(ViewWillShow)] && [controller respondsToSelector:@selector(viewWillShow)]) {
        [controller viewWillShow];
    }
}


@end
