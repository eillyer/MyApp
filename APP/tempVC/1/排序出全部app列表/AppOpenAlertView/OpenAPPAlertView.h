//
//  OpenAPPAlertView.h
//  com.homing.alwayshome
//
//  Created by julong on 2017/5/30.
//  Copyright © 2017年 eillyer. All rights reserved.
//

typedef void(^CancelActionBlock)();
typedef void(^NoticeActionBlock)();



#import <UIKit/UIKit.h>

@interface OpenAPPAlertView : UIView

@property (nonatomic,copy)CancelActionBlock cancelActionBlock;
@property (nonatomic,copy)NoticeActionBlock noticeActionBlock;



/**
 * 创建弹出视图
 * @param cancelTitle 取消按钮标题
 * @param cancelBlock 取消按钮block
 */
- (OpenAPPAlertView *)initWithwithCancelTitle:(NSString *)cancelTitle
                              WithCancelBlock:(void (^)())cancelBlock;

/**
 创建通知弹出窗口

 @param dict 窗口展示的内容
 @param cancelBlock 取消
 @param actionBlock 动作
 @return self
 */
- (OpenAPPAlertView *)initWithwithContentDict:(NSDictionary *)dict
                                  cancelBlock:(void (^)())cancelBlock
                                  actionBlock:(void (^)())actionBlock;
/**
 * 视图弹出
 */
- (void)show;
@end
