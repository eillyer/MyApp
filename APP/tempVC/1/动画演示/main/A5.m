//
//  A5.m
//  APP
//
//  Created by eillyer on 2018/1/15.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "A5.h"

@implementation A5

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    drawImage();
}
//绘制图片
void drawImage () {
    UIImage *image = [UIImage imageNamed:@"icon"];
    //    [image drawAtPoint:CGPointMake(10, 40)];
    [image drawInRect:CGRectMake(10, 10, 80, 80)];
    //    [image drawAsPatternInRect:CGRectMake(10, 40, 30, 30)];
    NSString *str = @"水印文字";
    NSMutableDictionary *dict = [NSMutableDictionary new];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    dict[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [str drawInRect:CGRectMake(10, 10, 90, 30) withAttributes:dict];
    
    
}
@end
