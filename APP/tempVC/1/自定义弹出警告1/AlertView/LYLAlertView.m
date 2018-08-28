//
//  LYLAlertView.m
//  Share365
//
//  Created by eillyer on 2017/12/2.
//  Copyright © 2017年 eillyer. All rights reserved.
//


#import "LYLAlertView.h"
#import "UIView+layerView.h"
@implementation LYLAlertView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
//    self.backgroundColor = [UIColor blackColor];
//    self.BGvIEW.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    self.contentView.backgroundColor = UIColorFromRGB(244, 244, 244, 1);
    [self.topView setCAColorStarColor:UIColorFromRGB(252, 95, 32, 1) endColor:UIColorFromRGB(246, 62, 83, 1) isH:NO];
//    [self.cancel setCAColorStarColor:UIColorFromRGB(252, 95, 32, 1) endColor:UIColorFromRGB(246, 62, 83, 1) isH:NO];
    [self.action setCAColorStarColor:UIColorFromRGB(252, 95, 32, 1) endColor:UIColorFromRGB(246, 62, 83, 1) isH:NO];
    [self.contentView setR:20 wid:0 color:nil];
    [self.action setR:22.5 wid:0 color:nil];
    [self.cancel setR:22.5 wid:0 color:nil];
}

- (IBAction)action:(id)sender {
    NSLog(@"购买会员");
}

- (IBAction)cancel:(id)sender {
    [self removeFromSuperview];
}


+(void) animationAlert:(UIView *)view
{

    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = 0.4;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAnimation.keyTimes = @[@0.0f, @0.5f, @0.75f, @1.0f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [view.layer addAnimation:popAnimation forKey:nil];
}

- (void)show{
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [[self class] animationAlert:self.allView];
}
@end
