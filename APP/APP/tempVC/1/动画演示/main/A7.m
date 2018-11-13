//
//  A7.m
//  APP
//
//  Created by eillyer on 2018/1/15.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "A7.h"
#define kRadius 70
#define kTopY 100
#define kColor [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];

@implementation A7

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    drawBody();
    drawLine();
    drawEye();
    drawShe();
    drawMo();
}

//身体
void drawBody (){
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 50, 30);
    CGContextAddLineToPoint(context, 50, 60);
    CGContextSetLineWidth(context, 50);
    CGContextSetLineCap(context, kCGLineCapRound);
    [[UIColor yellowColor] set];
    CGContextStrokePath(context);
    
}
//带子
void drawLine (){
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 25, 40);
    CGContextAddLineToPoint(context, 75, 40);
    CGContextSetLineWidth(context, 10);
    CGContextSetLineCap(context, kCGLineCapButt);
    [[UIColor blackColor] set];
    CGContextStrokePath(context);
}
//眼睛
void drawEye (){
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextAddArc(context, 50, 40, 10, 0, M_PI*2, 1);
    [[UIColor blackColor] set];
    CGContextStrokePath(context);
    CGContextRestoreGState(context);

    CGContextSaveGState(context);
    CGContextAddArc(context, 50, 40, 5, 0, M_PI*2, 1);
    [[UIColor whiteColor] set];
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
    
    CGContextSaveGState(context);
    CGContextAddArc(context, 50, 40, 3, 0, M_PI*2, 1);
    CGContextSetLineWidth(context, 6);
    [[UIColor blackColor] set];
    CGContextStrokePath(context);
    CGContextRestoreGState(context);

    
    
    
    
}
//嘴巴
void drawMo (){
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextMoveToPoint(context, 35, 65);
    CGContextAddQuadCurveToPoint(context, 50, 80, 65, 65);
    CGContextSetLineWidth(context, 2);
    [[UIColor blackColor] set];
    CGContextStrokePath(context);
}
//舌头
void drawShe (){
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextMoveToPoint(context, 55, 73);
//    CGContextAddQuadCurveToPoint(context, 50, 200, 65, 65);
    CGContextAddCurveToPoint(context, 55, 85, 90, 85, 65, 65);
    CGContextSetLineWidth(context, 2);
    [[UIColor orangeColor] set];
//    CGContextfliiPath(context);
//    CGContextStrokePath(context);

    CGContextFillPath(context);
}
@end
