//
//  A2.m
//  APP
//
//  Created by eillyer on 2018/1/13.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "A2.h"

@implementation A2


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

    
    drawingRect();
    drawingSAN();
    
    
}

void drawingRect(){
    //获得上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置四边形
    CGContextAddRect(context, CGRectMake(10, 10, 20, 20));
    //    设置颜色
    [[UIColor orangeColor] setFill];
    
    CGContextFillPath(context);
    
}

void drawingSAN(){
    CGContextRef context = UIGraphicsGetCurrentContext();
    //三角形
    CGContextMoveToPoint(context, 40, 40);
    CGContextAddLineToPoint(context, 80, 60);
    CGContextAddLineToPoint(context, 70, 90);
    //关闭路径（链接最后一个点和开始点）
    CGContextClosePath(context);
    [[UIColor redColor] set];
    CGContextStrokePath(context);
}
@end
