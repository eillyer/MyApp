//
//  FingerprintModel.m
//  APP
//
//  Created by eillyer on 2017/11/10.
//  Copyright © 2017年 eillyer. All rights reserved.
//
/*
 1.首先导入框架LocalAuthentication
 2.判断系统版本，最低iOS 8.0
 3.创建验证对象上下文LAContext
 4.判断指纹识别技术是否可用canEvaluatePolicy
 5.如果可用，开始调用方法开始使用指纹识别
 
 */
#import "FingerprintModel.h"
#import <LocalAuthentication/LocalAuthentication.h>
@implementation FingerprintModel
+ (void)FingerprintIsSuccess:(void(^)(BOOL TheSuccess))TheSuccess
                       error:(void(^)(NSString *error))errorBlock{
    //系统支持，最低iOS 8.0
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0){
        LAContext * context = [[LAContext alloc] init];
        NSError * error;
        if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]){
            //localizedReason: 指纹识别出现时的提示文字
            [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"指纹解锁" reply:^(BOOL success, NSError * _Nullable error) {
                if (success){
                    //识别成功
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //在主线程中，处理 ......
                        TheSuccess(YES);
                    });
                }else if (error){
                    NSLog(@"LAPolicyDeviceOwnerAuthenticationWithBiometrics -- %@",error);
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //在主线程中，处理 ......
                        TheSuccess(NO);
                        errorBlock(error.description);
                    });
                }
            }];
        }else if([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:nil]){
            [context evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:@"密码解锁" reply:^(BOOL success, NSError * _Nullable error){
                NSLog(@"LAPolicyDeviceOwnerAuthentication -- %@", error);
            }];
        }
        NSLog(@" --- %@ ", error);
    }
}
@end
