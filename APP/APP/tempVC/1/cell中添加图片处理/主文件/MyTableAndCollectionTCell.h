//
//  MyTableAndCollectionTCell.h
//  FriendWay_v_1.0.1
//
//  Created by julong on 2017/9/19.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MyTableAndCollectionCItem.h"


@interface TCellCollectionView : UICollectionView
@property (nonatomic, strong) NSIndexPath *indexPath;


@end


static NSString *CollectionViewCellIdentifier = @"MyTableAndCollectionCItem";



@interface MyTableAndCollectionTCell : UITableViewCell
@property (nonatomic,strong) NSDictionary * dict;

//@property (nonatomic,assign) NSInteger row;

@property (nonatomic, strong) TCellCollectionView *collectionView;

- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath;

@end
