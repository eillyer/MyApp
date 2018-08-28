//
//  LoginVC.m
//  QualityCloud
//
//  Created by julong on 2017/4/5.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import "LoginVC.h"
#import "FWTabBarController.h"

#import "MyaAlertController.h"
#import "UIColor+color.h"

#import "UserInfoModel.h"
//#import "PassWord.h"
//#import "UserRealm.h"


@interface LoginVC ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *okBtn;

@property (weak, nonatomic) IBOutlet UIView *numberView;

@property (weak, nonatomic) IBOutlet UIView *passwordView;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;//登录按钮
@property (weak, nonatomic) IBOutlet UIButton *saveName;
@property (weak, nonatomic) IBOutlet UIButton *savePassword;
@property (weak, nonatomic) IBOutlet UIImageView *right1;
@property (weak, nonatomic) IBOutlet UIImageView *right2;


@property (nonatomic,strong) UIActivityIndicatorView *activity;//菊花
@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self settingData];
    [self settingView];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.loginBtn setR:22.5 wid:0  color:kFWColorGreen];
    [self.loginBtn setCAColorStarColor:kColorStar endColor:kColorEnd Tdo:^{
        
    }];
}
- (void)settingData{
    
}
- (IBAction)saveName:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.right1.hidden = !sender.selected;
    
//    sender.backgroundColor = sender.selected?[UIColor redColor]:[UIColor clearColor];
    
}
- (IBAction)savepassword:(UIButton *)sender {
    sender.selected = !sender.selected;
//    sender.backgroundColor = sender.selected?[UIColor redColor]:[UIColor clearColor];
    self.right2.hidden = !sender.selected;

    
}
- (void)settingView{
//    self.navigationBar.translucent = NO;

//    [self.loginBtn setR:25 wid:1 color:kFWColorGreen];
//    [self.loginBtn setCAColorStarColor:kColorStar endColor:kColorEnd]
    
    
    //切角view
    [self.numberView setR:22.5 wid:1 color:kFWColorgran];
    self.numberView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    
    [self.passwordView setR:22.5 wid:1 color:kFWColorgran];
    self.passwordView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];

    
    //切角Btn
    

//    self.loginBtn.backgroundColor = kColorEnd;
    

    
    //代理
    self.usernameTF.delegate = self;
    self.usernameTF.keyboardType = UIKeyboardTypeEmailAddress;
    [self.usernameTF setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];

    self.passwordTF.delegate = self;
    [self.passwordTF setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];

    self.passwordTF.returnKeyType = UIReturnKeyDone;
    
}



- (IBAction)loginAction:(UIButton *)sender {
    
    
    NSString *str = [NSString stringWithFormat:@"%@/login",kNetMain];
    

    
    
    NSDictionary *dic = @{@"name":self.usernameTF.text,
                          @"password":self.passwordTF.text};
    
    
    
    [kNetWorkHelper postDataWithStringsOfURL:str
                                      selfVC:self
                              isShowProgress:NO
                 imageDataArrOrMp4PathStrArr:nil
                                  parameters:dic
                                        file:nil
                                     success:^(NSDictionary *responseDict) {
                                         NSLog(@"%@",responseDict);
                                         
                                         NSString *error = responseDict[@"error"];
                                         
                                         if (!error.length) {
                                             //对象存储
                                             [Utility saveUserInfoModel:responseDict[@"content"]];
                                             FWTabBarController *rootVC = [[FWTabBarController alloc] init];
                                             [self presentViewController:rootVC animated:YES completion:nil];
                                         }else{
                                             [Utility showAlertDialog:self title:@"提示" message:responseDict[@"error"] handler:nil];
                                         }
                                     } error:^(NSString *error) {
                                         NSLog(@"%@",error);
                                         [Utility showAlertDialog:self title:@"提示" message:error handler:nil];
                                         
                                     } number:nil];
    
    
}




#pragma mark - textField delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == self.usernameTF) {
        [self.usernameTF resignFirstResponder];
        [self.passwordTF becomeFirstResponder];
    }
    
    if (textField == self.passwordTF) {
        [self.passwordTF resignFirstResponder];
        [self loginAction:nil];
    }
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    CGRect rect = self.view.frame;
    rect.origin.y -= 70;
    
    [UIView animateWithDuration:0.4 animations:^{
        self.view.frame = rect;
    }];
    
    if (textField == self.usernameTF) {
        //        [self.numberView setR:4 wid:1 color:KGreedColor];
        //        [self.passwordView setR:4 wid:1 color:kGradColor];
        
        self.numberView.layer.borderColor = kFWColorgran.CGColor;
        self.passwordView.layer.borderColor = kFWColorgran.CGColor;
    }
    
    if (textField == self.passwordTF) {
        //        [self.passwordView setR:4 wid:1 color:KGreedColor];
        //        [self.numberView setR:4 wid:1 color:kGradColor];
        self.passwordView.layer.borderColor = kFWColorgran.CGColor;
        self.numberView.layer.borderColor = kFWColorgran.CGColor;
    }
    
    
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    CGRect rect = self.view.frame;
    rect.origin.y += 70;
    
    [UIView animateWithDuration:0.4 animations:^{
        self.view.frame = rect;
    }];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    self.passwordView.layer.borderColor = kFWColorgran.CGColor;
    self.numberView.layer.borderColor = kFWColorgran.CGColor;
}


- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"loginSuccess" object:nil];
}




@end
