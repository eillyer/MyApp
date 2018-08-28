//
//  MapLocationVC.m
//  APP
//
//  Created by julong on 2017/10/26.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import "MapLocationVC.h"

#import "LocationManager.h"


@interface MapLocationVC ()
@property (nonatomic,strong) dispatch_source_t time;
@end

@implementation MapLocationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    NSTimer *timer = [NSTimer timerWithTimeInterval:5  target:self selector:@selector(location:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
}
- (IBAction)location:(id)sender {
    [LocationManager sharedLocatiomManager].sendValueBlock = ^(NSString *jingdu,NSString *weidu,CLPlacemark *a,BOOL isOK,NSString *error){
        
        NSLog(@"J：%@   W：%@  address：%@",jingdu,weidu,a.name);
        
        NSLog(@"定位结束");
        
    };
    
}

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
