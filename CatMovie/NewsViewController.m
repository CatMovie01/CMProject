//
//  NewsViewController.m
//  CatMovie
//
//  Created by qianfeng on 15/9/24.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // [super initData];
    // self.view.backgroundColor=RandomColor;
    [self initNetData];
    //[self createHeaderView];
 
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
  

}
/*-(void)createHeaderView{
     NSInteger f=self.newsID;
    NSLog(@"%ld",f);
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64-49) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.dataArr = [[NSMutableArray alloc] init];
    
    
       UIImageView* View=[[UIImageView alloc]init];
       NSLog(@"image=%@",self.imageUrl);
       [View sd_setImageWithURL:[NSURL URLWithString:self.imageUrl]];
       View.frame=CGRectMake(0, 0, 100, ScreenHeight/3);
       //
    UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0,View.bottom-40, ScreenWidth, 40)];
    view.backgroundColor=[UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.7];
    
    UILabel*label=[Factory createLabelWithTitle:self.name frame:CGRectMake(0,5, ScreenWidth, 30) textColor:[UIColor whiteColor] fontSize:18.f];
    //label
    label.textAlignment=NSTextAlignmentCenter;
    [view addSubview:label];
    [View addSubview:view];
      self.tableView.tableHeaderView=View;
      [self.view addSubview:self.tableView];
}*/


-(void)initNetData{
    [super initData];
    [self getData];
}
-(void)getData{
    
    AFHTTPRequestOperationManager*mananger=[AFHTTPRequestOperationManager manager];
    mananger.responseSerializer=[AFHTTPResponseSerializer serializer];
    [mananger GET:NewsURL parameters:Nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
       // NSDictionary* dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:Nil];
        
        //NSLog(@"%@",dic);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
//#pragma mark - delegate
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    // return self.dataArr.count;
//    return 5;
//}
//-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSString* CellID=@"CellID";
//    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:CellID];
//    if (cell==nil) {
//        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
//    }
//    return cell;
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
