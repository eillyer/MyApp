//
//  GyroscopeVC.m
//  APP
//
//  Created by eillyer on 2018/1/11.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "GyroscopeVC.h"
#import "YGGravity.h"
#import "imageVC.h"
@interface GyroscopeVC ()
@property (weak, nonatomic) IBOutlet UILabel *x;
@property (weak, nonatomic) IBOutlet UILabel *y;
@property (weak, nonatomic) IBOutlet UILabel *z;

@end

@implementation GyroscopeVC

- (void)viewDidLoad {
    [super viewDidLoad];


    [YGGravity sharedGravity].timeInterval = 0.01;
    [[YGGravity sharedGravity] startDeviceMotionUpdatesBlock:^(float x, float y, float z) {
        self.x.text = [NSString stringWithFormat:@"%f",x];
        self.y.text = [NSString stringWithFormat:@"%f",y];
        self.z.text = [NSString stringWithFormat:@"%f",z];
    }];




}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)imageA:(id)sender {
    imageVC *vc = [imageVC new];
    [self.navigationController pushViewController:vc animated:YES];
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
