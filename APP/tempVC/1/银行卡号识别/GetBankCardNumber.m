//
//  GetBankCardNumber.m
//  APP
//
//  Created by eillyer on 2017/12/11.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import "GetBankCardNumber.h"
#import "XLYBankCardMessage.h"
@interface GetBankCardNumber (){
    UILabel *lab;
}

@end

@implementation GetBankCardNumber

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
    lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    [self.view addSubview:lab];
    lab.numberOfLines = 0;
    lab.textAlignment = NSTextAlignmentCenter;
    lab.textColor = [UIColor blackColor];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 50)];
    label.text = @"银行卡号：";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:15];
    label.textAlignment = YES;
    label.backgroundColor = [UIColor whiteColor];
    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(0, 200, 300, 50)];
    tf.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tf];
    tf.leftView = label;
    tf.leftViewMode = UITextFieldViewModeAlways;
    tf.keyboardType =  UIKeyboardTypeDecimalPad;
    [tf addTarget:self action:@selector(tfTextChange:) forControlEvents:UIControlEventEditingChanged];
    tf.center = CGPointMake(kScreenWidth/2, kScreenHeight/2);
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)tfTextChange:(UITextField *)tf{
    lab.text = [[XLYBankCardMessage shareInstance] xlyBankCardMessageWithBankCardNumber:tf.text returnBankCardMessageType:0];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
