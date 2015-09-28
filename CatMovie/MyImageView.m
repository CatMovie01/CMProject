//
//  MyImageView.m
//  WallStreet
//
//  Created by qianfeng on 15/7/28.
//  Copyright (c) 2015年 yty. All rights reserved.
//

#import "MyImageView.h"

@implementation MyImageView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
    }
    return self;
}
/*- (void)CreateimageUrl:(NSString*)image Name:(NSString*)name{
    self.userInteractionEnabled=YES;
    self.frame=CGRectMake(0, 0, 100, ScreenHeight/3);
  
 UIView*  view=[[UIView alloc]initWithFrame:CGRectMake(0,self.bottom-40, ScreenWidth, 40)];
    view.backgroundColor=[UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.7];
    
   UILabel* label=[Factory createLabelWithTitle:name frame:CGRectMake(0,5, ScreenWidth, 30) textColor:[UIColor whiteColor] fontSize:18.f];
    //label
    label.textAlignment=NSTextAlignmentCenter;
    [view addSubview:label];
    [self addSubview:view];
    
    [self sd_setImageWithURL:[NSURL URLWithString:image]];
}*/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.delegate respondsToSelector:@selector(ImagePushViewController:)]) {
        [self.delegate ImagePushViewController:self];
    }
}
@end
