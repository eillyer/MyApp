//
//  FWNavigationController.h
//  FriendWay-v1.0
//
//  Created by liyonglong on 16/9/19.
//  Copyright © 2015年 eillyer. All rights reserved.
//

#import "FWNavigationController.h"
#import "UIColor+color.h"

@interface FWNavigationController ()

@end

@implementation FWNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];


    
    self.navigationBar.translucent = NO;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, -20, kScreenWidth, 20)];
    [view setCAColorStarColor:kColorStar endColor:kColorEnd Tdo:nil];
    [self.navigationBar addSubview:view];
    [self.navigationBar setCAColorStarColor:kColorStar endColor:kColorEnd Tdo:nil];
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg"] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationBar setBackgroundColor:[UIColor clearColor]];
//    self.navigationBar.barStyle = UIBarStyleBlackOpaque;
    
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count >0) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"return"] forState:UIControlStateNormal];
        [btn sizeToFit];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btn.frame = CGRectMake(0, 0, 30, 30);
        //        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
        [btn addTarget:self action:@selector(backVC:) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        viewController.hidesBottomBarWhenPushed = YES;
//        [self.navigationBar setCAColorStarColor:kColorStar endColor:kColorEnd];
    }
    [super pushViewController:viewController animated:animated];
}
- (void)backVC:(UIButton *)sender{
    [self popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
