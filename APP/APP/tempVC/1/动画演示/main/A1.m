//
//  A1.m
//  APP
//
//  Created by eillyer on 2018/1/13.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "A1.h"

@implementation A1


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    drwaline();

}
void drwaline(){
//    1,获取图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
//    2,绘制图形
    CGContextSetLineWidth(context, 2);

    CGContextSetRGBFillColor(context, 1, 0, 0, 1);//颜色
    //起点
    CGContextMoveToPoint(context, 10, 10);
    //划线
    CGContextAddLineToPoint(context, 50, 50);
    
    //    3,显示view
    CGContextStrokePath(context);
    
//    2.线条
    [[UIColor blueColor] set];
//    设置线条头尾部的样式
    CGContextSetLineCap(context, kCGLineCapRound);
//    设置转折点的样式
    CGContextSetLineJoin(context, kCGLineJoinRound);
//    划线
    CGContextMoveToPoint(context, 10, 30);
    CGContextAddLineToPoint(context, 30, 30);
    CGContextAddLineToPoint(context, 40, 10);
    
    CGContextStrokePath(context);

}

@end
