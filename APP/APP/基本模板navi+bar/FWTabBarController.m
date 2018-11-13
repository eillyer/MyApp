//
//  FWTabBarController.m
//  FriendWay-v1.0
//
//  Created by liyonglong on 16/9/19.
//  Copyright © 2015年 eillyer. All rights reserved.
//

#import "FWTabBarController.h"
#import "mm1.h"
#import "mm2.h"
#import "mm3.h"

#import "FWNavigationController.h"


//二版

#import "UIImage+image.h"

@interface FWTabBarController ()
//@property (nonatomic,strong) FWNavigationController *bar1;
//@property (nonatomic,strong) FWNavigationController *bar2;
//@property (nonatomic,strong) FWNavigationController *bar3;
//@property (nonatomic,strong) FWNavigationController *bar4;


@end

@implementation FWTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.tintColor = UIColorFromHex(0xffffff);
//    self.tabBar.tintColor = [UIColor colorWithRed:25/255.0 green:180.0/255 blue:145.0/255 alpha:1];//选择的颜色
//    self.tabBar.barTintColor = [UIColor colorWithRed:25/255.0 green:180.0/255 blue:145.0/255 alpha:1];背景色
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:UIColorFromHex(0xb2b2b2),NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:UIColorFromHex(0x0096ff),NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];

//    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil]];
    
    [self setingView];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotifi:) name:@"sendMSG" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotifi1:) name:@"userMSG" object:nil];
}
- (void)receiveNotifi:(NSNotification *)notifi{
    NSLog(@"notifi.object-->%@",notifi.object);
    NSLog(@"notifi.userInfo-->%@",notifi.userInfo);

    
}
- (void)receiveNotifi1:(NSNotification *)notifi1{
    NSLog(@"notifi.object-->%@",notifi1.object);
    NSLog(@"notifi.userInfo-->%@",notifi1.userInfo);

    
}

- (void)setingView{
    

    mm1 *homeVC = [[mm1 alloc] init];
    FWNavigationController *navi1 = [[FWNavigationController alloc] initWithRootViewController:homeVC];
    [self setUpOneChirldVC:navi1
                 imageName:@"zhuye02"
         selectedImageName:@"zhuye01"
                     title:@"M1"];
    
    mm2 *statisticalVC = [[mm2 alloc] init];
    FWNavigationController *navi2 = [[FWNavigationController alloc] initWithRootViewController:statisticalVC];
    [self setUpOneChirldVC:navi2
                 imageName:@"tongji02"
         selectedImageName:@"tongji01"
                     title:@"M2"];

    
    mm3 *meVC = [[mm3 alloc] init];
    FWNavigationController *navi4 = [[FWNavigationController alloc] initWithRootViewController:meVC];
    [self setUpOneChirldVC:navi4
                 imageName:@"wode02"
         selectedImageName:@"wode01"
                     title:@"M3"];
    

    
}
- (void)setUpOneChirldVC:(UIViewController *)vc imageName:(NSString *)image selectedImageName:(NSString *)selectedImage title:(NSString *)title{
//    vc.tabBarItem.title = title;
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageWithNameOfOriger:image];
    vc.tabBarItem.selectedImage = [UIImage imageWithNameOfOriger:selectedImage];
    [self addChildViewController:vc];
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
