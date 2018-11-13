//
//  AddImageAndMp4VC.m
//  APP
//
//  Created by julong on 2017/10/25.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#import "AddImageAndMp4VC.h"
#import "ImageAndMovEditVC.h"

@interface AddImageAndMp4VC ()
@property (nonatomic,strong) ImageAndMovEditVC *vc;
@end

@implementation AddImageAndMp4VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSArray *arr = @[[UIImage imageNamed:@"aaa"],@"http://upload-images.jianshu.io/upload_images/2542851-46f12f1caefa1fb4.jpg",@"http://baobab.wdjcdn.com/1455782903700jy.mp4"];

    _vc = [[ImageAndMovEditVC alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 100) type:AddAll superVC:self theMaxNumber:8 dataArr:arr];
    //改变视图高度
    __weak typeof (self) weakSelf = self;
    _vc.sendImageAndMovEditHeightBlack = ^(NSInteger height) {
        [weakSelf settingViewFrame:height];
    };
    [self addChildViewController:_vc];

    [self.view addSubview:_vc.view];
    
    
}

- (void)settingViewFrame:(NSInteger)h{
    _vc.view.frame = CGRectMake(0, 0, kScreenWidth, h);
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
