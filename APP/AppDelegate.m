//
//  AppDelegate.m
//  MySourceApp
//
//  Created by eillyer on 2017/12/26.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#define kAppKey @"5cef19f12b16e93d01b69e0d9f7a4138"


#import "AppDelegate.h"
#import "FWTabBarController.h"




#import <BmobSDK/Bmob.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /*
     注册Bmob的服务器
     
     */
    [Bmob registerWithAppKey:kAppKey];
    
    
    
//    [BmobUser loginWithUsernameInBackground:@"share44" password:@"share44" block:^(BmobUser *user, NSError *error) {
//        NSLog(@"%@",user);
//
//        if (error) {
//            exit(1);
//            GGLog(@"%@",error.description);
//        }else{
//            GGLog(@"%@",user);
//        }
//    }];
    
    
    
    //    注册用户
//    http://doc.bmob.cn/data/ios/develop_doc/#_77
    //        BmobUser *user = [[BmobUser alloc] init];
    //        user.password = [NSString stringWithFormat:@"share%d",i];
    //        user.username = [NSString stringWithFormat:@"share%d",i];
    //        [user signUpInBackground];
    
    //添加数据
    //往GameScore表添加一条playerName为小明，分数为78的数据
//    BmobObject *gameScore = [BmobObject objectWithClassName:@"test"];
//    [gameScore setObject:@"小明asdf" forKey:@"playerName"];
//    [gameScore setObject:@78 forKey:@"score"];
//    [gameScore setObject:[NSNumber numberWithBool:YES] forKey:@"cheatMode"];
//    [gameScore saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
//        //进行操作
//        NSLog(@"%@",isSuccessful?@"yes":@"no");
//    }];
    
    
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        
        
//            NSString *fileString = [[NSBundle mainBundle] pathForResource:@"123456" ofType:@"ipa"];
//
//            BmobObject *obj = [BmobObject objectWithClassName:@"VPN"];
//        //    BmobFile *file1 = [[BmobFile alloc] initWithClassName:@"Asc" withFilePath:fileString];
//            BmobFile *file1 = [[BmobFile alloc] initWithFilePath:fileString];
//            [file1 saveInBackground:^(BOOL isSuccessful, NSError *error) {
//                if (isSuccessful) {
//                    [obj setObject:file1  forKey:@"Data"];
//                    [obj setObject:file1.url  forKey:@"url"];
//                    [obj saveInBackground];
//                    NSLog(@"file1 url %@",file1.url);
//                }else{
//                    NSLog(@"失败");
//                }
//            } withProgressBlock:^(CGFloat progress) {
//                NSLog(@"上传进度%.2f",progress);
//            }];
        
        
//        NSData *data = UIImagePNGRepresentation([UIImage imageNamed:@"1.png"]);
//        BmobFile *file = [[BmobFile alloc]initWithFileName:@"512.png" withFileData:data];
//        BmobObject *obj = [BmobObject objectWithClassName:@"VPN"];
//        [file saveInBackground:^(BOOL isSuccessful, NSError *error) {
//            //如果文件保存成功，则把文件添加到filetype列
//            if (isSuccessful) {
//                //上传文件的URL地址
//                [obj setObject:file.url  forKey:@"url"];
//                //此处相当于新建一条记录,         //关联至已有的记录请使用 [obj updateInBackground];
//                [obj saveInBackground];
//                NSLog(@"成功");
//            }else{
//                //进行处理
//                NSLog(@"失败%@",error.description);
//
//            }
//        }];
    });
    

    
    
//    NSString *fileString = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"png"];
//
//    BmobObject *obj = [BmobObject objectWithClassName:@"VPN"];
////    BmobFile *file1 = [[BmobFile alloc] initWithClassName:@"Asc" withFilePath:fileString];
//    BmobFile *file1 = [[BmobFile alloc] initWithFilePath:fileString];
//    [file1 saveInBackground:^(BOOL isSuccessful, NSError *error) {
//        if (isSuccessful) {
//            [obj setObject:file1  forKey:@"Data"];
//            [obj setObject:file1.url  forKey:@"url"];
//            [obj saveInBackground];
//            NSLog(@"file1 url %@",file1.url);
//        }else{
//            NSLog(@"失败");
//        }
//    } withProgressBlock:^(CGFloat progress) {
//        NSLog(@"上传进度%.2f",progress);
//    }];
    //开启显示打印台
    
    
    
    self.window.rootViewController = [FWTabBarController new];
    
    
    
    //基本界面
    /*
     self.window.backgroundColor = [UIColor whiteColor];
     
     
     BOOL isFirst = [[NSUserDefaults standardUserDefaults] boolForKey:@"isNotFirst"];
     
     if (!isFirst) {
     self.window.rootViewController = [[FirstCome alloc] init];
     }else{
     
     BOOL isLogin = [[NSUserDefaults standardUserDefaults] boolForKey:@"isLogin"];
     
     if (isLogin) {
     
     self.window.rootViewController = [FWTabBarController new];
     }else{
     self.window.rootViewController = [LoginVC new];
     }
     }
     
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotifi:) name:@"loginSuccess" object:nil];
     */
    
    return YES;
}


- (void)receiveNotifi:(NSNotification *)notifi{
    NSLog(@"notifi.object-->%@",notifi.object);
    NSLog(@"notifi.userInfo-->%@",notifi.userInfo);
    //    NSString *str = [NSString stringWithFormat:@"%@/reg/client",kNetMain];
    
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

