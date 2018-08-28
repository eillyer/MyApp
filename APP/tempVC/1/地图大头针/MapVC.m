//
//  MapVC.m
//  APP
//
//  Created by eillyer on 2017/11/17.
//  Copyright © 2017年 eillyer. All rights reserved.
//
#define MERCATOR_RADIUS 85445659.44705395

#import "MapVC.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MyAnnotation.h"
#import "MyAnnotationCell.h"

@interface MapVC ()<MKMapViewDelegate>
{
    BOOL firstDisplay;
}
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) CLLocationManager *locMgr;
@property (strong, nonatomic) CLGeocoder *gcoder;

@end

@implementation MapVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settingData];
    [self settingView];
}
- (void)settingData{
    firstDisplay = YES;
    // 追踪位置
    self.mapView.showsUserLocation = YES;
//    self.mapView.userTrackingMode = MKUserTrackingModeFollowWithHeading;
    
    _locMgr = [[CLLocationManager alloc] init];
    [_locMgr requestAlwaysAuthorization];
    // 不允许转动地图
//    self.mapView.rotateEnabled = NO;
    self.mapView.delegate = self;

    


}
- (void)settingView{
    
}

- (IBAction)add:(id)sender {
    //放置随机大头针
    //- (void)addAnnotation:(id <MKAnnotation>)annotation;
    MyAnnotation *anno = [[MyAnnotation alloc] init];
    anno.title = @"服务：保姆";
    anno.subtitle = @"电话：13801010010";
    CLLocationDegrees latitude = 34.239465 + arc4random_uniform(100)/10;
    CLLocationDegrees longtitude = 108.943446 + arc4random_uniform(100)/10;
    anno.coordinate = CLLocationCoordinate2DMake(latitude, longtitude);
    [self.mapView addAnnotation:anno];
}



#pragma mark - 地图代理

//系统cell大头针

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    

    static NSString *ID = @"anno";
    MyAnnotationCell * cell = (MyAnnotationCell *)[mapView dequeueReusableAnnotationViewWithIdentifier:ID];
    if (!cell) {
        cell = [[MyAnnotationCell alloc] initWithAnnotation:annotation reuseIdentifier:ID];
    }
    cell.image = [UIImage imageNamed:@"aaa"];
    
    if(![cell.annotation isKindOfClass:[MyAnnotation class]]){
        return nil;
    }
    return cell;
}
/*
//每次大头针初始化的cell
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    static NSString *ID = @"anno";
    // 如果返回nil，系统会按照默认方式显示，如果自定义，是无法直接显示的，并且点击大头针之后不会显示标题，需要自己手动设置显示
    // 如果想要直接显示，应该调用MKPinAnnotationView
    MKPinAnnotationView *annoView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:ID];
    
    if (annoView == nil) {
        annoView = [[MKPinAnnotationView alloc] initWithAnnotation:nil reuseIdentifier:ID];
        // 大头针属性
        annoView.animatesDrop = YES; // 设置大头针坠落的动画
        annoView.canShowCallout = NO; // 设置点击大头针是否显示气泡
        annoView.calloutOffset = CGPointMake(0, 0); // 设置大头针气泡的偏移
        // 设置大头针气泡的左右视图、可以为任意UIView
//        annoView.leftCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
//        annoView.rightCalloutAccessoryView = [[UISwitch alloc] init];
//        annoView.backgroundColor = [UIColor redColor];// 设置大头针颜色
    }
    
    // 设置大头针的图片，如果是直接创建MKPin，则无效。
    //annoView.image = [UIImage imageNamed:@"pin"];
    annoView.image = [UIImage imageNamed:@"an"];
    annoView.annotation = annotation;
    
    // 如果是用户位置，应当显示默认的圆点而不是大头针，因此应当判断是否是MyAnnotation
    if(![annoView.annotation isKindOfClass:[MyAnnotation class]]){
        return nil;
    }
    
    return annoView;
}
*/

/*
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    static NSString *ID = @"anno";
    // 如果返回nil，系统会按照默认方式显示，如果自定义，是无法直接显示的，并且点击大头针之后不会显示标题，需要自己手动设置显示
    // 如果想要直接显示，应该调用MKPinAnnotationView
    MKAnnotationView *annoView = [mapView dequeueReusableAnnotationViewWithIdentifier:ID];
    
    if (annoView == nil) {
        annoView = [[MKAnnotationView alloc] initWithAnnotation:nil reuseIdentifier:ID];
        // 大头针属性
        //annoView.animatesDrop = YES; // MKPinAnnotaionView才有效，设置大头针坠落的动画
        annoView.canShowCallout = YES; // 设置点击大头针是否显示气泡
        annoView.calloutOffset = CGPointMake(0, 0); // 设置大头针气泡的偏移
        // 设置大头针气泡的左右视图、可以为任意UIView
//        annoView.leftCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
//        annoView.rightCalloutAccessoryView = [[UISwitch alloc] init];
        //[annoView setPinColor:MKPinAnnotationColorPurple]; // MKPinAnnotaionView才有效，设置大头针的颜色
    }
    
    // 设置大头针的图片
    annoView.image = [UIImage imageNamed:@"aaa"];
    
    annoView.annotation = annotation;
    
    // 如果是用户位置，应当显示默认的圆点而不是大头针，因此应当判断是否是MyAnnotation
    if(![annoView.annotation isKindOfClass:[MyAnnotation class]]){
        return nil;
    }
    return annoView;
}
*/
//每次用户位置改变时调用
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    // 地图上当前位置也属于一个大头针，可以拥有标题、子标题和位置信息。
    // 大头针上的内容由模型确定，这个模型就是MKUserLocation
    // 通过修改模型属性影响大头针标题和副标题
    [_gcoder reverseGeocodeLocation:userLocation.location completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *pm = [placemarks firstObject];
        userLocation.title = pm.locality;
        userLocation.subtitle = pm.name;
    }];
    
    // 对于iOS8以前，设置地图跨度与中心位置。
    if([[UIDevice currentDevice].systemVersion doubleValue] < 8.0){
        NSLog(@"7");
        // iOS8.0和以后会自动移动大头针
        // 移动地图到当前大头针
        [mapView setCenterCoordinate:userLocation.location.coordinate animated:YES];
        //放大地图，以便看清当前路线
        [mapView setRegion:MKCoordinateRegionMake(userLocation.location.coordinate, MKCoordinateSpanMake(0.1, 0.1)) animated:YES];
    }
    
    //设置显示区域
    if (firstDisplay) {//是否是第一次显示地图
        //坐标
        CLLocationCoordinate2D coord2D = userLocation.location.coordinate;
        NSLog(@"------纬度：%f  经度：%f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
        //显示范围精度
        MKCoordinateSpan span = {0.005,0.005};
        //显示区域
        MKCoordinateRegion region = {coord2D,span};
        //设置显示区域
        [mapView setRegion:region animated:YES];
        
        firstDisplay = NO;
    }
}

- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated{
    NSLog(@"区域即将改变");
}

-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    NSLog(@"区域改变");
    NSLog(@"%f %f",self.mapView.region.span.latitudeDelta,self.mapView.region.span.longitudeDelta);
    NSLog(@"zoom level %d", [self getZoomLevel:_mapView]);

}

//判断缩放程度
- (int)getZoomLevel:(MKMapView*)mapView {
    return 21-round(log2(_mapView.region.span.longitudeDelta * MERCATOR_RADIUS * M_PI / (180.0 * _mapView.bounds.size.width)));
}
@end
