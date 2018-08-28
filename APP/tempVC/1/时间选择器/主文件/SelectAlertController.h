//
//  SelectAlertController.h
//  WeinanApp1
//
//  Created by julong on 2016/11/22.
//  Copyright © 2016年 eillyer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectAlertController : UIAlertController
@property (nonatomic,strong) NSMutableArray * arr;//传入的数组

@property (nonatomic,strong) NSString * showNameKey;//展示数据的key


typedef void(^changeStr)(NSString *title,NSDictionary *dict);

@property (nonatomic, copy) changeStr string;//



@end
