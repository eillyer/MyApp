//
//  LYLSystemTools.m
//  APP
//
//  Created by eillyer on 2018/1/25.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "LYLSystemTools.h"

@implementation LYLSystemTools

- (instancetype)initWithDistanceSensing
{
    self = [super init];
    if (self) {
        [UIDevice currentDevice].proximityMonitoringEnabled = YES;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(proximityStateDidChange:) name:UIDeviceProximityStateDidChangeNotification object:@"距离"];
    }
    return self;
    
}
- (void)proximityStateDidChange:(NSNotification *)notifi{
    NSLog(@"notifi.object-->%@",notifi.object);
    self.sendLYLSystemTool(@{@"name":notifi.object,@"state":[UIDevice currentDevice].proximityState?@"有物体靠近":@"有物体离开"});
}

- (void)dealloc{
    NSLog(@"系统工具死亡");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
