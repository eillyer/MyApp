//
//  imageVC.m
//  APP
//
//  Created by eillyer on 2018/1/11.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "imageVC.h"
//#import "YGGravity.h"
#import "YGGravityImageView.h"
@interface imageVC ()

@end

@implementation imageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    YGGravityImageView *imageView = [[YGGravityImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height+20)];
    imageView.image = [UIImage imageNamed:@"login_bg6.png"];
    [self.view addSubview:imageView];
    
    [imageView startAnimate];
    
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
