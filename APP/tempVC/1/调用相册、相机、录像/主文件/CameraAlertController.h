//
//  CameraAlertController.h
//  WeinanApp1
//
//  Created by julong on 2016/11/22.
//  Copyright © 2016年 eillyer. All rights reserved.
//


typedef NS_ENUM(NSInteger,ImageOrMp4) {
    defaultType = 0,//默认两个
    imageType,//只有image
    mp4Type,//只有录像
    TheOtherType   //扩展
};

#import <UIKit/UIKit.h>

@interface CameraAlertController : UIAlertController

@property (nonatomic,weak) UIViewController * superVC;


@property (nonatomic,assign) ImageOrMp4 mediaType;

//录像返回照片和MP4的路径
typedef void(^mediaData)(UIImage *,NSString *);
@property (nonatomic, copy) mediaData imageAndPath;

//调用的时候
/*
             alert.imageAndPath = ^(UIImage *image,NSString *path){
            其中已经得到了图片信息和路径信息
             };
*/





@end
