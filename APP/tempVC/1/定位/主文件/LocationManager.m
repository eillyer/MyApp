//
//  LocationManager.m
//  WeinanApp1
//
//  Created by julong on 2016/12/19.
//  Copyright © 2016年 eillyer. All rights reserved.
//

#import "LocationManager.h"
@interface LocationManager ()<CLLocationManagerDelegate>
@property (nonatomic,strong) CLLocationManager *locationManger;//定位管理

@end
@implementation LocationManager


+ (instancetype)sharedLocatiomManager{
    static LocationManager *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

            helper = [[LocationManager alloc] init];
    });
    
    [helper findMe];
    
    return helper;
}
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        [self findMe];
//    }
//    return self;
//}

//- (void)getValueJingdu:(void(^)(NSString *jingdu))jingdu
//                 weidu:(void(^)(NSString *weidu))weidu
//                weizhi:(void(^)(CLPlacemark *weizhi))weizhi
//                  isOK:(void(^)(BOOL isOK))isOK
//                 error:(void(^)(NSString *error))errorBlock{
//
//    
//    self.sendValueBlock=^(NSString *jingdu,NSString *weidu,CLPlacemark *a,BOOL isOK,NSString *error){
//        jingdu(jingdu);
//        
//    };
//    
//}



#pragma mark -- 定位的代理
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    //拒绝
    if ([error code] == kCLErrorDenied)
    {
        
        self.sendValueBlock(@"",@"",nil,NO,@"为了提供更多服务请设置:设置>隐私>开启定位");
        //访问被拒绝
//        //        NSLog(@"拒绝定位");
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"为了提供更多服务请设置:设置>隐私>开启定位" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style: UIAlertActionStyleCancel handler:nil];
//        [alert addAction:action];
//        [self presentViewController:alert animated:YES completion:nil];
    }
    //无法获取
    if ([error code] == kCLErrorLocationUnknown) {
        
        self.sendValueBlock(@"",@"",nil,NO,@"因网络原因无法获得位置信息,请手动设置");

//        //无法获取位置信息
//        NSLog(@"无法获得位置信息%@",error);
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"因网络原因无法获得位置信息,请手动设置" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style: UIAlertActionStyleCancel handler:nil];
//        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"去设置" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            [self selectCityInList];
//        }];
//        [alert addAction:action];
//        [alert addAction:action1];
//        [self presentViewController:alert animated:YES completion:nil];
    }
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations{
    //得到经纬度
    if (locations && locations.count) {
        CLLocationCoordinate2D lastCoordinate2D = locations.lastObject.coordinate;
//        NSLog(@"经度:%f 维度:%f",lastCoordinate2D.longitude,lastCoordinate2D.latitude);
        [self.locationManger stopUpdatingLocation];
        //反编码获得城市名
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        [geocoder reverseGeocodeLocation:[locations lastObject] completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            /*
             NSLog(@"全部:%@",placemarks.lastObject.addressDictionary);
             */
            
            NSString *jinddu = [NSString stringWithFormat:@"%f",lastCoordinate2D.longitude];
            NSString *weidu = [NSString stringWithFormat:@"%f",lastCoordinate2D.latitude];
            if (placemarks && placemarks.count) {
                //省:
//                NSString *sheng = placemarks.lastObject.addressDictionary[@"State"];
//                //城:
//                NSString *city = placemarks.lastObject.addressDictionary[@"City"];
                

                
                self.sendValueBlock(jinddu,weidu,placemarks.lastObject,YES,nil);

                
            }else{
                NSLog(@"编码信息错误");
                
                CLPlacemark *pla = [[CLPlacemark alloc] init];
//                pla[name] = @"未获取到具体位置";
                [pla setValue:@"未获取到具体位置" forKeyPath:@"name"];
                self.sendValueBlock(jinddu,weidu,pla,YES,@"编码信息错误");

            }
        }];
    }
}


#pragma mark -- 懒加载
- (CLLocationManager *)locationManger{
    if (!_locationManger) {
        _locationManger = [[CLLocationManager alloc] init];
        _locationManger.delegate = self;
        _locationManger.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManger.distanceFilter = 10;
    }
    return _locationManger;
}
- (void)findMe{
    if ([self.locationManger respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        NSLog(@"requestAlwaysAuthorization");
        //        [self.locationManger requestAlwaysAuthorization];
        [self.locationManger requestWhenInUseAuthorization];
    }
    
    [self.locationManger startUpdatingLocation];
    NSLog(@"开始定位");
}
@end
