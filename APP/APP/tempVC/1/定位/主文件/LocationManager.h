//
//  LocationManager.h
//  WeinanApp1
//
//  Created by julong on 2016/12/19.
//  Copyright © 2016年 eillyer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

typedef void(^sendLocationValue)(NSString *jingdu,NSString *weidu,CLPlacemark *weizhi,BOOL isOK,NSString *erro);

@interface LocationManager : NSObject


+ (instancetype)sharedLocatiomManager;




@property (nonatomic,copy) sendLocationValue sendValueBlock;//copy 将 block 从栈区 copy 到堆区,已提供使用




//- (void)getValueJingdu:(void(^)(NSString *jingdu))jingdu
//                 weidu:(void(^)(NSString *weidu))weidu
//                weizhi:(void(^)(CLPlacemark *weizhi))weizhi
//                  isOK:(void(^)(BOOL isOK))isOK
//                 error:(void(^)(NSString *error))errorBlock;


@end
