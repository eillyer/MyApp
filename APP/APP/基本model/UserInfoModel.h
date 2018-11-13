//
//  UserInfoModel.h
//  FriendWay_v_1.0.1
//
//  Created by julong on 16/9/26.
//  Copyright © 2016年 eillyer. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface UserInfoModel : NSObject<NSCoding>
@property (nonatomic,strong) NSString * userId;//用户id
@property (nonatomic,strong) NSString * companyName;//公司名称
@property (nonatomic,strong) NSString * companyId;//公司id
@property (nonatomic,strong) NSString * position;//职务
@property (nonatomic,strong) NSString * tel;//电话
@property (nonatomic,strong) NSString * companyType;//公司级别
@property (nonatomic,strong) NSString * userIcon;//头像
@property (nonatomic,strong) NSString * positionType;//职务级别
@property (nonatomic,strong) NSString * userName;//用户


@property (nonatomic,strong) NSArray * firstImages;//引导页图片
@property (nonatomic,strong) NSArray * homeImages;//首页图片
@property (nonatomic,strong) NSArray * projectList;//首页图片
@property (nonatomic,strong) NSArray * homePage;//主功能



+ (instancetype)sharedUserInfoModel;//全局访问单利






@end
