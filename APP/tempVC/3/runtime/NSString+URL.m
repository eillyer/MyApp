//
//  NSString+URL.m
//  APP
//
//  Created by eillyer on 2018/1/15.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "NSString+URL.h"
#import <objc/runtime.h>
@implementation NSString (URL)

+ (void)load{
    //获取到两个方法method
//    method_exchangeImplementations(, )//交换两个方法
//    class_getClassMethod([NSString class], @selector(stringWithFormat:));//类方法
//    class_getInstanceMethod([NSString class], @selector(stringWithURL:));//实例方法

    
    
    Method m1 = class_getClassMethod([NSString class], @selector(stringWithString:));
    Method m2 = class_getClassMethod([NSString class], @selector(stringWithURL:));
    method_exchangeImplementations(m1, m2);
}

+ (instancetype)stringWithURL:(NSString *)str{
    
    NSString *str1 = [NSString stringWithURL:str];
    if (str.length>0) {
        NSLog(@"ok");
        return str1;
    }
    return @"no";
}
@end
