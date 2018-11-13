//
//  ViewController.m
//  MySourceApp
//
//  Created by eillyer on 2017/12/26.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import "ViewController.h"
//http://blog.csdn.net/JinJie_ing/article/details/45077739 代码块迁移

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //奇怪字符
    NSString *str1 = @"    ";
    NSString *str2 = @"    ";
    NSString *str3 = @"    ";
    NSString *str4 = @"   ";
    NSString *str5 = @"  ";
    NSString *str6 = @" ";
    NSString *str7 = @"";
    NSString *str8 = @"   ";
    NSString *str9 = @"  ";
    NSString *str10 = @" ";
    NSString *str11 = @"";
    NSString *str12 = @"";
    NSString *str13 = @"";
    //    NSString *str2 = @"\x10\x10\x10";
    
    NSLog(@"%@====%ld====%ld",@"    ",@"    ".length,str1.length);
    NSLog(@"%@====  %ld",str2,str2.length);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

