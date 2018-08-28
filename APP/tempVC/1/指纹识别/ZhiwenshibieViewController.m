//
//  ZhiwenshibieViewController.m
//  APP
//
//  Created by eillyer on 2017/11/10.
//  Copyright © 2017年 eillyer. All rights reserved.
//
#import "ZhiwenshibieViewController.h"
#import "FingerprintModel.h"
@interface ZhiwenshibieViewController ()
@property (weak, nonatomic) IBOutlet UILabel *name;
@end
@implementation ZhiwenshibieViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}
//开始识别
- (IBAction)action:(id)sender {
    [FingerprintModel FingerprintIsSuccess:^(BOOL TheSuccess) {
        if (TheSuccess) {
            self.name.text = @"解锁成功";
        }else{
            self.name.text = @"解锁失败";
        }
    } error:^(NSString *error) {
        NSLog(@"指纹解锁失败原因：%@",error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
