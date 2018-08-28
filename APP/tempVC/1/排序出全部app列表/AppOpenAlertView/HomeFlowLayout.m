//
//  HomeFlowLayout.m
//  FriendWay_v_1.0.1
//
//  Created by julong on 16/9/20.
//  Copyright © 2016年 eillyer. All rights reserved.
//

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#import "HomeFlowLayout.h"



@implementation HomeFlowLayout
- (instancetype)init{

    self = [super init];
    self.itemSize = CGSizeMake((kScreenWidth-40)/3, 100);
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.headerReferenceSize = CGSizeMake(0, 0);
    self.sectionHeadersPinToVisibleBounds = NO;
    self.sectionFootersPinToVisibleBounds = NO;
    return self;
}
@end
