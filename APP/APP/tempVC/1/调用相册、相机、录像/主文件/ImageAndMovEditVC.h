//
//  ImageAndMovEditVC.h
//  APP
//
//  Created by julong on 2017/10/25.
//  Copyright © 2017年 eillyer. All rights reserved.
//

typedef NS_ENUM(NSInteger,theVCType) {
    AddImage,
    AddMp4,
    AddAll,
    EditImage,
    EditMp4,
    EditAll
};

typedef void(^sendImageAndMovEditHeightBlack)(NSInteger height);
typedef void(^sendImageAndMovBlack)(UIImage *iamge,NSString *mp4Patn);


#import <UIKit/UIKit.h>



@interface ImageAndMovEditVC : UIViewController

@property (nonatomic,assign) theVCType theVCType;
//高度变化
@property (nonatomic,copy) sendImageAndMovEditHeightBlack sendImageAndMovEditHeightBlack;//copy 将 block 从栈区 copy 到堆区,已提供使用
@property (nonatomic,copy) sendImageAndMovBlack sendImageAndMovBlack;//copy 将 block 从栈区 copy 到堆区,已提供使用




/**
 初始化方法

 @param frame 规定的大小
 @param type 展示方式
 @param vc 父控制器
 @param number 规定张数  如果为0 ：表示不限制。其他数值为规定数值
 @param dataArr 带入的数据数组

 @return vc
 */

- (instancetype)initWithFrame:(CGRect)frame type:(theVCType)type superVC:(UIViewController *)vc theMaxNumber:(NSInteger)number dataArr:(NSArray *)dataArr;


@end
