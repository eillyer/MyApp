//
//  ARViewController.m
//  APP
//
//  Created by eillyer on 2018/3/16.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "ARViewController.h"

@interface ARViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *web;

@end

@implementation ARViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    [self.web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://r.jizy.cn/analysis/index?url=http://youku163.zuida-bofang.com/20180222/IZyw5WBL/index.m3u8&ec=7k9k8u" relativeToURL:nil]]];
    [self.web loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://r.jizy.cn/analysis/index?url=http://youku163.zuida-bofang.com/20180222/IZyw5WBL/index.m3u8&ec=7k9k8u"]]];
    
    
    
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
