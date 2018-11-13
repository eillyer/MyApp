//
//  CUSFrame.m
//  APP
//
//  Created by eillyer on 2017/11/17.
//  Copyright © 2017年 eillyer. All rights reserved.
//


/*
 https://www.cnblogs.com/carlos-mm/p/6489395.html?utm_source=itdadao&utm_medium=referral
 http://www.jianshu.com/p/e25e4b391a68
 
 
 如果想让一个 .a 文件能同时用在真机和模拟器上，需要进行合并
 在终端输入指令
 
 lipo -create 静态库1 静态库2 -output 新静态库名称.a
 localhost:~ micaimanong$ cd /Users/micaimanong/Library/Developer/Xcode/DerivedData/MyStaticLibraryDM-fczwjaefnkvdmjelggxccgpicgwy/Build/Products
 
 localhost:Products micaimanong$ lipo -create Debug-iphoneos/libMyStaticLibraryDM.a Debug-iphonesimulator/libMyStaticLibraryDM.a  -output libMyStaticLibraryDM.a
 
 
 */
#import "CUSFrame.h"

//#import "AAAAAAA.h"
@interface CUSFrame ()

@end

@implementation CUSFrame

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)alert:(UIButton *)sender {
    
//    [AAAAAAA showToastMessage:@"=====0=0=0=0"];
    
    
    
    
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
