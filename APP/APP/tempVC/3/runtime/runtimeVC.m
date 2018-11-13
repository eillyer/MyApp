//
//  runtimeVC.m
//  APP
//
//  Created by eillyer on 2018/1/15.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "runtimeVC.h"
#import "NSString+URL.h"
@interface runtimeVC ()

@end

@implementation runtimeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSString *a = [NSString stringWithString:@"1111"];
    NSLog(@"%@",a);
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
