//
//  Utility.h
//  TableViewMJ
//
//  Created by julong on 2017/6/23.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,MJTableViewType) {
    allType,//上下都有
    headerType,//只有下拉
    footType//只有上拉
};


@interface Utility : NSObject

+ (instancetype)sharedUtility;



/**
 给tableView添加上拉下拉，必须先导入MJRefresh
 
 @param tableView 需要添加的TableView
 @param type 添加的类型
 @param headerAction 下拉的操作
 @param footAction 上拉的操作
 */
+ (void)addMJRefreshForTableView:(UITableView *)tableView
                          MJType:(MJTableViewType)type
                    headerAction:(void(^)(void))headerAction
                      footAction:(void(^)(void))footAction;




/**
 普通警告框
 
 @param viewCtrl 当前的VC
 @param title 标题
 @param message 警告信息
 @param handler 警告操作
 */
+ (void) showAlertDialog:(UIViewController *)viewCtrl title:(NSString *)title message:(NSString *)message handler:(void (^)(UIAlertAction *action))handler;



/**
 全局单点提示
 
 @param message 提示内容
 */
+ (void)showToastMessage:(NSString *)message;


/**
 登录信息存储
 
 @param dict 返回数据的主信息
 */
+ (void)saveUserInfoModel:(NSDictionary *)dict;


/**
 隐藏键盘
 
 @param _txtField 哪个输入框
 */
+ (void)cmdHideKeyboard:(UITextField*)_txtField;

/**
 直接再Window上添加一张图片，并且逐渐消失
 */
+ (void)showToastImage;

/**
 系统弹框
 
 @param title 标题
 @param text 内容
 @param Action 事件处理（nil则展示取消按钮）
 */
+ (void)showSYSAlertTitle:(NSString *)title
                     text:(NSString *)text
                   Action:(void(^)(void))Action;

@end

