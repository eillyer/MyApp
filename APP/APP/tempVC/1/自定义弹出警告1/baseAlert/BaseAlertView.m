//
//  BaseAlertView.m
//  APP
//
//  Created by eillyer on 2018/10/29.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "BaseAlertView.h"

@implementation BaseAlertView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0,0, kScreenWidth, kScreenHeight)];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self insertSubview:btn atIndex:0];
    
}

- (void)btnAction{
    [self removeFromSuperview];
}


@end
