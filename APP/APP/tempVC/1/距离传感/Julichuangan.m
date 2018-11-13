//
//  Julichuangan.m
//  APP
//
//  Created by eillyer on 2018/9/6.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "Julichuangan.h"
//#import "LYLSystemTools.h"
#import "LYLSystemTools.h"
@interface Julichuangan ()

@end

@implementation Julichuangan

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    LYLSystemTools *a = [LYLSystemTools initWithDistanceSensing];
    LYLSystemTools *a = [[LYLSystemTools alloc] initWithDistanceSensing];
    
    a.sendLYLSystemTool = ^(NSDictionary *dict) {
        NSLog(@"%@",dict);
    };
    
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
