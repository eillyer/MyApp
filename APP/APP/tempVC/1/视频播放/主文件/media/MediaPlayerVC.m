//
//  MediaPlayerVC.m
//  WeinanApp1
//
//  Created by julong on 2016/11/29.
//  Copyright © 2016年 eillyer. All rights reserved.
//

#import "MediaPlayerVC.h"
#import "XSMediaPlayer.h"

@interface MediaPlayerVC ()
@property(nonatomic,strong)XSMediaPlayer *player;

@end

@implementation MediaPlayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    _player = [[XSMediaPlayer alloc]initWithFrame:self.view.frame];
    //    _player.videoURL = [NSURL fileURLWithPath:path];
//    _player.videoURL = [NSURL URLWithString:@"http://baobab.wdjcdn.com/1455782903700jy.mp4"];
    
    self.player = [[XSMediaPlayer alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];

    self.player.videoURL = self.videoURL;
    [self.view insertSubview:_player atIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backVC:(UIButton *)sender {
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)dealloc{
    [self.player removeFromSuperview];
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
