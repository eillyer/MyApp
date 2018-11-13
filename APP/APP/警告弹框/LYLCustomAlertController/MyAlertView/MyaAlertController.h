//
//  MyaAlertController.h
//  QualityCloud
//
//  Created by julong on 2017/4/12.
//  Copyright © 2017年 eillyer. All rights reserved.
//

typedef NS_ENUM(NSInteger,AlertStyle) {
    typeUp,//取消在上面的
    typeDown//取消在下面的，如果是一个按钮的，在titleArr中@[@"取消"]，一个元素的宿主
};

#import <UIKit/UIKit.h>

typedef void(^selectRow)(NSInteger row, NSString * title);


@interface MyaAlertController : UIViewController

@property (nonatomic,strong) NSString * titleName;

@property (nonatomic,strong) NSArray * titleArr;

@property (nonatomic,assign) AlertStyle alertStyle;

@property (nonatomic,copy) selectRow selectRow;//copy 将 block 从栈区 copy 到堆区,已提供使用

/*
 title : 当前提示
 contentText ：
 titleArr : 主要视图展示的列表内容
 alertType :不同的样式
 
 
 
 
 
 */

+ (instancetype)alertTitle:(NSString *)title
               contentText:(NSString *)contentText
            actionTitleArr:(NSArray *)titleArr
                 alertType:(AlertStyle)alertType
                    action:(void(^)(NSInteger row1, NSString *title1))successBlock;

- (void)alertTitle:(NSString *)title
               contentText:(NSString *)contentText
            actionTitleArr:(NSArray *)titleArr
                 alertType:(AlertStyle)alertType
                 delegate:(UIViewController *)VC
                    action:(void(^)(NSInteger row1, NSString *title1))successBlock;

@end
