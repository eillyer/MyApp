//
//  FirstCome.m
//  QualityCloud
//
//  Created by julong on 2017/4/5.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import "FirstCome.h"
#import "LoginVC.h"


#import "SDCycleScrollView.h"


@interface FirstCome ()<SDCycleScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *bannerView;

@property (nonatomic,strong) UIButton * btn;

@end

@implementation FirstCome

- (void)viewDidLoad {
    [super viewDidLoad];
 
    //轮播图
    SDCycleScrollView *banner = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) delegate:self placeholderImage:nil];
    
    NSMutableArray *imageArr = [NSMutableArray new];
    if (kUserInfo.firstImages.count) {
        for (NSDictionary *dic in kUserInfo.firstImages) {
            NSURL *url = [NSURL URLWithString:dic[@"name"]];
            [imageArr addObject:url];
            
        }
        banner.imageURLStringsGroup = imageArr;
    }else{
        banner.localizationImageNamesGroup = @[@"1",@"2",@"3"];
    }
    [self.bannerView addSubview:banner];
    
    banner.autoScroll = NO;
    banner.infiniteLoop = NO;
    banner.currentPageDotColor = kColorEnd;
    banner.pageDotColor = [UIColor whiteColor];
    banner.pageControlBottomOffset = 23;
    
    banner.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    banner.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    banner.delegate = self;
    
    _btn = [[UIButton alloc] initWithFrame:CGRectMake(100,100, kScreenWidth - 200,40)];
    _btn.center = CGPointMake(banner.center.x, kScreenHeight - 110 + 20);
//    _btn.backgroundColor = kFWColorgran;
    _btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [_btn setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.3]];
    [_btn setR:20 wid:2 color:[UIColor whiteColor]];
    [_btn addTarget:self action:@selector(passAction:) forControlEvents:UIControlEventTouchUpInside];
    [_btn setTitle:@"立即进入" forState:UIControlStateNormal];
    [self.view addSubview:_btn];
    
    [_btn setHidden:YES];
    
    
}
- (IBAction)passAction:(UIButton *)sender {
    //进入
    [self presentViewController:[LoginVC new] animated:YES completion:nil];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isNotFirst"];

}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    NSLog(@"%ld",index);
    
    if (index==2) {
        [_btn setHidden:NO];
    }else{
        [_btn setHidden:YES];
    }
    
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
