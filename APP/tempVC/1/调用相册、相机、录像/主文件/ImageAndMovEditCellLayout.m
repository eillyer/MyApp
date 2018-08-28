//
//  ImageAndMovEditCellLayout.m
//  APP
//
//  Created by julong on 2017/10/25.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import "ImageAndMovEditCellLayout.h"

@implementation ImageAndMovEditCellLayout


- (instancetype)init{
    self = [super init];
    self.itemSize = CGSizeMake(kScreenWidth/4-10, kScreenWidth/4-10);
    self.minimumLineSpacing = 5;
    self.minimumInteritemSpacing = 5;
    self.sectionInset = UIEdgeInsetsMake(5, 5, 2, 2);
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    return self;
}

- (instancetype)initWithCount:(NSInteger)count{
    self = [super init];
    self.itemSize = CGSizeMake(kScreenWidth/count-10, kScreenWidth/count-10);
    self.minimumLineSpacing = 5;
    self.minimumInteritemSpacing = 5;
    self.sectionInset = UIEdgeInsetsMake(5, 5, 2, 2);
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    return self;
}


@end
