//
//  LYLSystemTools.h
//  APP
//
//  Created by eillyer on 2018/1/25.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYLSystemTools : NSObject


typedef void(^sendLYLSystemTool)(NSDictionary *dict);


@property (nonatomic,copy) sendLYLSystemTool sendLYLSystemTool;//copy 将 block 从栈区 copy 到堆区,已提供使用


/**
 探测距离

 @return 从block熟悉获取值
 */
- (instancetype)initWithDistanceSensing;


@end
