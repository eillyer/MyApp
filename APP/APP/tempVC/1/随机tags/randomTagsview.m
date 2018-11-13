//
//  randomTagsview.m
//  APP
//
//  Created by eillyer on 2018/11/13.
//  Copyright © 2018 eillyer. All rights reserved.
//

#import "randomTagsview.h"
#import "UserServiceAllTypeView.h"
@interface randomTagsview ()

@end

@implementation randomTagsview

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
        NSArray *tagsArray = @[@"90后", @"价格优惠(11)", @"服务好(12)", @"手脚麻利", @"形象好(21)", @"神准时", @"为人亲切(9)"];
        UserServiceAllTypeView * tagsView = [[UserServiceAllTypeView alloc]initWithFrame:CGRectMake(0, 0, 300, 400) forAllTypeArr:tagsArray];
    tagsView.center = CGPointMake(kScreenWidth/2, kScreenHeight/2);
    [self.view addSubview:tagsView];
    
    

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
