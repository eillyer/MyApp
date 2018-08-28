//
//  FingerprintModel.h
//  APP
//
//  Created by eillyer on 2017/11/10.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FingerprintModel : NSObject
/**
 指纹解锁类方法，直接调用

 @param TheSuccess 返回解锁是否成功，成功yes，失败no
 @param errorBlock 当解锁失败的时候返回的错误信息，现在版本这个结果得不到（待优化）
 */
+ (void)FingerprintIsSuccess:(void(^)(BOOL TheSuccess))TheSuccess
                       error:(void(^)(NSString *error))errorBlock;

@end
