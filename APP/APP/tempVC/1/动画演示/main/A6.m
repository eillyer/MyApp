//
//  A6.m
//  APP
//
//  Created by eillyer on 2018/1/15.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "A6.h"

@implementation A6


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    drawBezier();
}

void drawBezier (){
//    1,绘制上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //起点，重点，控制点
    CGContextMoveToPoint(context, 10, 10);
    //两个控制点,和终点
//    CGContextAddCurveToPoint(context, 80, 10, 10, 80, 90, 90);
    //一个控制点
    CGContextAddQuadCurveToPoint(context, 10, 50, 90,90);
    
//    CGContextAddLineToPoint(context, 90, 90);
    
    CGContextStrokePath(context);
}

@end
