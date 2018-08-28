//
//  The3DTouchViewController.m
//  APP
//
//  Created by eillyer on 2017/11/10.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import "The3DTouchViewController.h"

@interface The3DTouchViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation The3DTouchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.redView.size = CGSizeMake(0, 0);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //宣告一个UITouch的指标来存放事件触发时所撷取到的状态
    UITouch *touch = [[event allTouches] anyObject];//得到触点
    NSLog(@"%f",touch.force);//触点力度
    CGPoint touchPoint = [touch locationInView:self.view];//在view的那个位置
    self.redView.size = CGSizeMake(50*touch.force, 50*touch.force);
    [self.redView setR:50*touch.force/2 wid:0 color:nil];
    self.redView.center = CGPointMake(touchPoint.x, touchPoint.y);
    
}
@end
