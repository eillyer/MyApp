//
//  MyAppManager.h
//  com.homing.alwayshome
//
//  Created by julong on 2017/5/30.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MyApp.h"

@interface MyAppManager : NSObject

@property (copy, nonatomic, readonly) NSArray *apps;

+ (instancetype)sharedManager;

/**
 *  扫描本地安装的 App
 */
- (void)scanApps;

/**
 *  打开 App
 *
 *  @param app MyApp
 *
 *  @return success
 */
- (BOOL)openApp:(MyApp *)app;

@end
