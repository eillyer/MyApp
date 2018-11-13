//
//  ImageAndMovEditCellLayout.h
//  APP
//
//  Created by julong on 2017/10/25.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageAndMovEditCellLayout : UICollectionViewFlowLayout


/**
 图片的展示形式

 @param count 屏幕宽度显示几个图片
 @return layout
 */
- (instancetype)initWithCount:(NSInteger)count;

    
    
@end
