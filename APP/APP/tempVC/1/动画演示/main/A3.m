//
//  A3.m
//  APP
//
//  Created by eillyer on 2018/1/15.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "A3.h"

@implementation A3

//
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
//    图形上下文站
    drwaline1();
    
}
void drwaline1(){
    //    1,获取图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
//    先拷贝一份上下文
    CGContextSaveGState(context);
    
    //    2,绘制图形
    CGContextSetLineWidth(context, 2);
    
    //第一条线
    //设置线段宽度
    CGContextSetLineWidth(context, 20);
    //头尾部样式
    CGContextSetLineCap(context, kCGLineCapRound);
    
    
    CGContextSetRGBFillColor(context, 1, 0, 0, 1);//颜色
    //起点
    CGContextMoveToPoint(context, 10, 10);
    //划线
    CGContextAddLineToPoint(context, 50, 50);
    
    //    3,显示view
    CGContextStrokePath(context);
//    当画完第一条线的时候，将图形上下文出栈，替换当前的上下文
    CGContextRestoreGState(context);
    
    
    
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
    
    CGContextSetLineWidth(context, 10);
    CGContextSetLineCap(context, kCGLineCapButt);

    
    CGContextStrokePath(context);
    
}
@end
