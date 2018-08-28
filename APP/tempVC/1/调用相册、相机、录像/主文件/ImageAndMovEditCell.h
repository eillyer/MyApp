//
//  ImageAndMovEditCell.h
//  APP
//
//  Created by julong on 2017/10/25.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^sendImageAndMovEditCellBlack)(BOOL isDelate,BOOL isPlay,NSInteger row);

@interface ImageAndMovEditCell : UICollectionViewCell
@property (nonatomic,strong) NSString * url;
@property (nonatomic,strong) UIImage * theImage;
@property (nonatomic,assign) NSInteger row;

@property (nonatomic,strong) NSDictionary * dict;
@property (nonatomic,assign) BOOL noDelate;

@property (nonatomic,copy) sendImageAndMovEditCellBlack sendImageAndMovEditCellBlack;//copy 将 block 从栈区 copy 到堆区,已提供使用

@end
