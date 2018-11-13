//
//  UserInfoModel.m
//  FriendWay_v_1.0.1
//
//  Created by julong on 16/9/26.
//  Copyright © 2016年 eillyer. All rights reserved.
//

#import "UserInfoModel.h"

@implementation UserInfoModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"UserInfoModel没有匹配的键值对%@：%@",key,value);
//    if ([key isEqualToString:@"id"]) {
//        self.Userid = [value stringValue];
//    }
}


+ (instancetype)sharedUserInfoModel{
    static UserInfoModel *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //排除取空
        NSData  *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserInfoModel"];
        if (data) {
            helper = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        }else{
            helper = [[UserInfoModel alloc] init];
        }
    });
    return helper;
}
- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    /*



     * position;//职务
     * tel;//电话

     * firstImages;//引导页图片
     * homeImages;//首页图片
     * projectList;//首页图片
     * homePage;//主功能
     */

    [aCoder encodeObject:self.userId forKey:@"userId"];
    [aCoder encodeObject:self.companyId forKey:@"companyId"];
    [aCoder encodeObject:self.companyName forKey:@"companyName"];
    [aCoder encodeObject:self.companyType forKey:@"companyType"];
    [aCoder encodeObject:self.position forKey:@"position"];
    [aCoder encodeObject:self.tel forKey:@"tel"];
    [aCoder encodeObject:self.firstImages forKey:@"firstImages"];
    [aCoder encodeObject:self.homeImages forKey:@"homeImages"];
    [aCoder encodeObject:self.projectList forKey:@"projectList"];
    [aCoder encodeObject:self.homePage forKey:@"homePage"];
    [aCoder encodeObject:self.userIcon forKey:@"userIcon"];
    [aCoder encodeObject:self.userName forKey:@"userName"];

    [aCoder encodeObject:self.positionType forKey:@"positionType"];

}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.userId = [aDecoder decodeObjectForKey:@"userId"];
        self.companyId = [aDecoder decodeObjectForKey:@"companyId"];
        self.companyName = [aDecoder decodeObjectForKey:@"companyName"];
        self.companyType = [aDecoder decodeObjectForKey:@"companyType"];
        self.position = [aDecoder decodeObjectForKey:@"position"];
        self.tel = [aDecoder decodeObjectForKey:@"tel"];
        self.firstImages = [aDecoder decodeObjectForKey:@"firstImages"];
        self.userName = [aDecoder decodeObjectForKey:@"userName"];

        self.homeImages = [aDecoder decodeObjectForKey:@"homeImages"];
        self.projectList = [aDecoder decodeObjectForKey:@"projectList"];
        self.homePage = [aDecoder decodeObjectForKey:@"homePage"];
        self.userIcon = [aDecoder decodeObjectForKey:@"userIcon"];
        self.positionType = [aDecoder decodeObjectForKey:@"positionType"];

    }
    return self;
}


@end
