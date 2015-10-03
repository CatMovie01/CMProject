//
//  LocationInfo.m
//  CatMovie
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "LocationInfo.h"

#define kCityURL @"http://api.m.mtime.cn/GetCityByLongitudelatitude.api?"

@interface LocationInfo () <CLLocationManagerDelegate>

@property (nonatomic,strong) CLLocationManager *manager;

@property (nonatomic) CLLocationCoordinate2D coordinate;

@end

@implementation LocationInfo
static LocationInfo *city=nil;

//static CLLocationManager *manager;

+(LocationInfo *)SharedCity
{
//    if (city==nil) {
        city=[[self alloc] init];
//    }
    return city;
}

-(instancetype)init
{
    self=[super init];
    if (self) {
        [self createCLManager];
    }
    return self;
}


-(void)createCLManager
{
    self.manager=[[CLLocationManager alloc] init];
    self.manager.delegate=self;
    self.manager.desiredAccuracy=kCLLocationAccuracyBest;
    self.manager.distanceFilter=5;
    //申请  授权  定位
    CGFloat version=[[[UIDevice currentDevice] systemVersion] floatValue];
    if (version>=8.0) {
        [self.manager requestAlwaysAuthorization];
    }
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"定位功能没有打开");
    }
    else
    {
        //
        [self.manager startUpdatingLocation];
    }
    
}

#pragma mark - 通过经纬度从接口获得当前的城市编码  定位城市
//定位获取城市位置和城市代码：http://api.m.mtime.cn/GetCityByLongitudelatitude.api?latitude=34.778616&longitude=113.682332


#pragma mark - CLLocationManagerDelegate


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location=[locations lastObject];
    self.coordinate=location.coordinate;
    
    [self getCityCode];
    
    
#if  1
//    CLGeocoder *geo=[[CLGeocoder alloc] init];
//    [geo reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
//        CLPlacemark *mark =[placemarks lastObject];
//        NSLog(@"name:%@",mark.name);
//        NSLog(@"country:%@",mark.country);
//        NSLog(@"dict:%@",mark.addressDictionary);
//    }];
    
#else
    //用百度地图的 地理反编码接口来 反编码
    NSString *url = [NSString stringWithFormat:@"http://api.map.baidu.com/geocoder?output=json&location=%f,%f&key=dc40f705157725fc98f1fee6a15b6e60",self.coordinate.latitude,self.coordinate.longitude];
    
    AFHTTPRequestOperationManager *af= [AFHTTPRequestOperationManager manager];
    af.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    [af GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *result=dict[@"result"];
        NSLog(@"地址:%@",result[@"formatted_address"]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"af下载失败");
    }];
#endif
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"定位失败");
}

-(void)getCityCode
{
    __weak typeof(self) weakSelf =self;
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    [manager GET:kCityURL parameters:[NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%lf",self.coordinate.latitude],@"latitude",[NSString stringWithFormat:@"%lf",self.coordinate.longitude],@"longitude", nil] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject) {
            NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            weakSelf.cityCode=dict[@"cityId"];
            weakSelf.cityName=dict[@"name"];
            weakSelf.pinyinShort=dict[@"pinyinShort"];
            //latitude=34.778616&longitude=113.682332
            if ([self.delegate respondsToSelector:@selector(UpdateCityCinema:)]) {
                [self.delegate UpdateCityCinema:self];
            }
            //
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"%@",@"失败");
    }];
}

@end
