//
//  MyTableAndCollectionTCell.m
//  FriendWay_v_1.0.1
//
//  Created by julong on 2017/9/19.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import "MyTableAndCollectionTCell.h"

@implementation TCellCollectionView

@end

@interface MyTableAndCollectionTCell ()


@property (weak, nonatomic) IBOutlet UIView *BGView;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *man;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *result;


@property (weak, nonatomic) IBOutlet UIView *theImage;



@end

@implementation MyTableAndCollectionTCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    [self.BGView setR:0 wid:1 color:UIColorFromHex(0x808080)];

    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.itemSize = CGSizeMake(90, 90);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView = [[TCellCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.collectionView registerClass:[MyTableAndCollectionCItem class] forCellWithReuseIdentifier:CollectionViewCellIdentifier];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.frame = CGRectMake(0, 0, kScreenWidth-20, 90);
    
    [self.theImage addSubview:self.collectionView];
}

- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath
{
    self.collectionView.dataSource = dataSourceDelegate;
    self.collectionView.delegate = dataSourceDelegate;
    self.collectionView.indexPath = indexPath;
    [self.collectionView setContentOffset:self.collectionView.contentOffset animated:NO];
    
    [self.collectionView reloadData];
}




- (void)setDict:(NSDictionary *)dict{
    _dict = dict;
    
    self.content.text = @"测试";
    self.man.text = @"测试";
    self.time.text = @"测试";
    self.result.text = @"测试";
    
    //设置照片
//    NSString *images = dict[@"image"];
//    if (images.length) {
//        [self.imageArr addObjectsFromArray:[images componentsSeparatedByString:@"|"]];
//        [self.imageArr removeObjectAtIndex:0];
//        
//        UINib *nib   = [UINib nibWithNibName:@"PlayerImageCell" bundle:[NSBundle mainBundle]];
//        [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"PlayerImageCell"];
//        [self.collectionView setCollectionViewLayout:[[ImageShowFlowLayout alloc] init]];
//        
//        
        
        //self.collectionView.delegate = self.superVC;
        //self.collectionView.dataSource = self.superVC;
        
//    }
    
    
}


//- (NSMutableArray *)imageArr{
//    if (!_imageArr) {
//        _imageArr = [NSMutableArray new];
//    }
//    return _imageArr;
//}

@end
