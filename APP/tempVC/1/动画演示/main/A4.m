//
//  A4.m
//  APP
//
//  Created by eillyer on 2018/1/15.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "A4.h"
CGFloat arc(CGFloat angle){
    return angle * (M_PI / 180);
}
@implementation A4


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    drawCircle();
    drawArc();
    drawText();
}
//椭圆
void drawCircle (){
//    1,获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
//    2,回执图形
    CGContextAddEllipseInRect(context, CGRectMake(10, 10, 30, 20));
//    3,显示在view
    [[UIColor redColor] set];
    CGContextStrokePath(context);
    
}
//扇形
void drawArc (){
    //上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //绘制图形(上下文，中心点x，中心点y，半径，开始角度，结束角度，顺0还是逆1)
    CGContextAddArc(context, 50, 50, 25, arc(0), arc(-90), 1);
//    CGContextSetLineWidth(context, 30);
//    CGContextSetLineCap(context, kCGLineCapRound);
    [[UIColor blueColor] set];
    CGContextStrokePath(context);
//    CGContextFillPath(context);
    
}
//绘制文字
void drawText (){

    NSString *str = @"asfwe";
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:20];//设置文字大小
    attributes[NSForegroundColorAttributeName] = [UIColor redColor];//设置文字颜色
    [str drawInRect:CGRectMake(20, 70, 100, 30) withAttributes:attributes];
}



@end
