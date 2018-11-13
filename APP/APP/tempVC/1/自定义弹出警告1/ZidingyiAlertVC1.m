//
//  ZidingyiAlertVC1.m
//  APP
//
//  Created by julong on 2017/10/19.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import "ZidingyiAlertVC1.h"
#import "MyaAlertController.h"
#import "LYLAlertView.h"
#import "ShowMyQRCodeAlertView.h"

@interface ZidingyiAlertVC1 ()

@end

@implementation ZidingyiAlertVC1

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    

}
- (IBAction)right:(id)sender {
    NSArray * arr = [[NSBundle mainBundle] loadNibNamed:@"LYLAlertView" owner:self options:nil];

    LYLAlertView *view = arr.lastObject;
    view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    view.title.text = @"抱歉！您还没有成为我们的上帝会员，所以还不能发布需求，请您先成为我们的上帝会员再来发布您的需求吧！";
    [view show];
}
- (IBAction)left:(id)sender {
    NSArray * arr = [[NSBundle mainBundle] loadNibNamed:@"ShowMyQRCodeAlertView" owner:self options:nil];
    ShowMyQRCodeAlertView * view = arr.lastObject;
    view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [view show];
}
- (IBAction)up:(id)sender {
    MyaAlertController *alert = [[MyaAlertController alloc] init];
    [alert alertTitle:@"提示" contentText:nil actionTitleArr:@[@"as",@"sadf",@"确定"] alertType:typeUp delegate:self action:^(NSInteger row1, NSString *title1) {
        
        NSLog(@"%ld,...%@",row1,title1);
        
    }];
    
}
- (IBAction)down:(id)sender {
    MyaAlertController *alert = [[MyaAlertController alloc] init];
    [alert alertTitle:@"提示" contentText:nil actionTitleArr:@[@"确定",@"取消"] alertType:typeDown delegate:self action:^(NSInteger row1, NSString *title1) {
        NSLog(@"%ld,...%@",row1,title1);
        
        
    }];
    
    
}

@end
