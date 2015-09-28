//
//  FilmCell.h
//  CatMovie
//
//  Created by qianfeng on 15/9/26.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilmCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *TitleName;
@property (strong, nonatomic) IBOutlet UILabel *summary;
@property (strong, nonatomic) IBOutlet UIImageView *smallIamge;
@property (strong, nonatomic) IBOutlet UILabel *nickName;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UIImageView *bigName;

@end
