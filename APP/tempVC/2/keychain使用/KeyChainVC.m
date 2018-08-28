//
//  KeyChainVC.m
//  APP
//
//  Created by eillyer on 2018/8/4.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "KeyChainVC.h"
#import "KeyChainManager.h"
@interface KeyChainVC ()

@end

@implementation KeyChainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setKy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setKy{
    NSString *Keychain = @"aaa";
    // 存储数据
    BOOL save = [KeyChainManager keyChainSaveData:@"思念诉说，眼神多像云朵" withIdentifier:Keychain];
    if (save) {
        NSLog(@"存储成功");
    }else {
        NSLog(@"存储失败");
    }
    // 获取数据
    NSString * readString = [KeyChainManager keyChainReadData:Keychain];
    NSLog(@"获取得到的数据:%@",readString);
    
    // 更新数据
    BOOL updata = [KeyChainManager keyChainUpdata:@"长发落寞，我期待的女孩" withIdentifier:Keychain];
    if (updata) {
        NSLog(@"更新成功");
    }else{
        NSLog(@"更新失败");
    }
    // 读取数据
    NSString * readUpdataString = [KeyChainManager keyChainReadData:Keychain];
    NSLog(@"获取更新后得到的数据:%@",readUpdataString);
    
    // 删除数据
    [KeyChainManager keyChainDelete:Keychain];
    // 读取数据
    NSString * readDeleteString = [KeyChainManager keyChainReadData:Keychain];
    NSLog(@"获取删除后得到的数据:%@",readDeleteString);
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
