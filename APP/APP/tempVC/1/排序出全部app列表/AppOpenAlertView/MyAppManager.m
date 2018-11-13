//
//  MyAppManager.m
//  com.homing.alwayshome
//
//  Created by julong on 2017/5/30.
//  Copyright © 2017年 eillyer All rights reserved.
//

#import "MyAppManager.h"

@implementation MyAppManager
#pragma mark - Life Cycle

+ (instancetype)sharedManager {
    
    static MyAppManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [[MyAppManager alloc] init];
    });
    
    return manager;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

#pragma mark - Public Methods
- (void)scanApps {
    
    Class cls = NSClassFromString(@"LSApplicationWorkspace");
    id s = [(id)cls performSelector:NSSelectorFromString(@"defaultWorkspace")];
    NSArray *arr = [s performSelector:NSSelectorFromString(@"allInstalledApplications")];
    NSMutableArray *apps = [NSMutableArray arrayWithCapacity:arr.count];
    for (id item in arr) {
        NSString *str = [item performSelector:NSSelectorFromString(@"applicationIdentifier")];
        NSLog(@"%@",str);
        if (![str containsString:@"apple"]) {
            [apps addObject: [[MyApp alloc] initWithAppProxy: item]];
        }
        
    }
    
    _apps = [apps copy];
}

- (BOOL)openApp:(MyApp *)app {
    
    Class cls = NSClassFromString(@"LSApplicationWorkspace");
    id s = [(id)cls performSelector:NSSelectorFromString(@"defaultWorkspace")];
    //
    BOOL success = [s performSelector:NSSelectorFromString(@"openApplicationWithBundleID:") withObject:[app bundleIdentifier]];
    NSLog(@"open: %zd", success);
    
    return success;
}

#pragma clang diagnostic pop


@end
