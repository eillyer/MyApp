//
//  MyTableAndCollectionVC.m
//  FriendWay_v_1.0.1
//
//  Created by julong on 2017/9/19.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import "MyTableAndCollectionVC.h"
#import "MyTableAndCollectionTCell.h"

#import <UIImageView+WebCache.h>


@interface MyTableAndCollectionVC ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource, UICollectionViewDelegate>
{
    UIImageView *imageViewBG;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (nonatomic, strong) NSMutableDictionary *contentOffsetDictionary;

@end

@implementation MyTableAndCollectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"MyTableAndCollectionTCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"MyTableAndCollectionTCell"];
    
    
    self.contentOffsetDictionary = [NSMutableDictionary dictionary];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return self.arr.count;
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  290;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    asdfsadfasdfasdf *cell = [tableView dequeueReusableCellWithIdentifier:@"sdfsadfasdfasdf"];
    
    MyTableAndCollectionTCell *cell = (MyTableAndCollectionTCell *)[tableView dequeueReusableCellWithIdentifier:@"MyTableAndCollectionTCell"];
    
    
    
    if (!cell)
    {
        cell = [[MyTableAndCollectionTCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyTableAndCollectionTCell"];
    }

    
    cell.dict = @{@"asf":@"ASDF"};

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(MyTableAndCollectionTCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setCollectionViewDataSourceDelegate:self indexPath:indexPath];
    NSInteger index = cell.collectionView.indexPath.row;
    
    CGFloat horizontalOffset = [self.contentOffsetDictionary[[@(index) stringValue]] floatValue];
    [cell.collectionView setContentOffset:CGPointMake(horizontalOffset, 0)];
}

#pragma mark - UICollectionViewDataSource Methods

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    /*
     NSDictionary *dict = self.arr[[(TCellCollectionView *)collectionView indexPath].row];
    
    NSString *images = dict[@"image"];
    NSMutableArray *imageArr = [NSMutableArray new];
    
    if (images.length) {
        [imageArr addObjectsFromArray:[images componentsSeparatedByString:@"|"]];
        [imageArr removeObjectAtIndex:0];
        
    }
    //    return collectionViewArray.count;
     
    return imageArr.count;
     */
    return 10;
}

-(UICollectionViewCell *)collectionView:(TCellCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyTableAndCollectionCItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewCellIdentifier forIndexPath:indexPath];

    
    cell.superIndexPath = collectionView.indexPath;
    /*
    NSDictionary *dict = self.arr[[(TCellCollectionView *)collectionView indexPath].row];
    
    NSString *images = dict[@"image"];
    NSMutableArray *imageArr = [NSMutableArray new];
    
    if (images.length) {
        [imageArr addObjectsFromArray:[images componentsSeparatedByString:@"|"]];
        [imageArr removeObjectAtIndex:0];
        
    }
    */
    UIImageView *image = [[UIImageView alloc] initWithFrame:cell.contentView.frame];
//    NSString *url = [NSString stringWithFormat:@"%@%@",kImageJDNet,imageArr[indexPath.row]];
//    NSString *url = [NSString stringWithFormat:@"https://gss0.baidu.com/7LsWdDW5_xN3otqbppnN2DJv/space/pic/item/d439b6003af33a87dd402a16cc5c10385343b588.jpg"];
//
//    [image sd_setImageWithURL:[NSURL URLWithString:url]];
//    [image setContentMode:UIViewContentModeScaleAspectFit];
    
    image.image = [UIImage imageNamed:@"an"];
    
    [cell addSubview:image];
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    MyTableAndCollectionCItem *cell = (MyTableAndCollectionCItem *)[collectionView cellForItemAtIndexPath:indexPath];
    
    NSLog(@"%@==========%@",indexPath,cell.superIndexPath);
    /*
    NSDictionary *dict = self.arr[[(TCellCollectionView *)collectionView indexPath].row];
    
    NSString *images = dict[@"image"];
    NSMutableArray *imageArr = [NSMutableArray new];
    
    if (images.length) {
        [imageArr addObjectsFromArray:[images componentsSeparatedByString:@"|"]];
        [imageArr removeObjectAtIndex:0];
        
    }
    
//    NSString *urlstr = [NSString stringWithFormat:@"%@%@",kImageJDNet,imageArr[indexPath.row]];
     */
    NSString *urlstr = [NSString stringWithFormat:@"https://gss0.baidu.com/7LsWdDW5_xN3otqbppnN2DJv/space/pic/item/d439b6003af33a87dd402a16cc5c10385343b588.jpg"];

    //放大照片
    imageViewBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    imageViewBG.contentMode = UIViewContentModeScaleAspectFit;
    //        NSDictionary *imageDic = self.imageArr[indexPath.row];
    
    NSURL *url = [NSURL URLWithString:urlstr];
    [imageViewBG sd_setImageWithURL:url];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0,0, kScreenWidth,kScreenHeight)];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@" " forState:UIControlStateNormal];
    
    //        [btn setBackgroundImage:imageViewBG.image forState:UIControlStateNormal];
    btn.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    
    [btn addSubview:imageViewBG];
    
    
    [self.navigationController.view addSubview:btn];
    
}

- (void)btnAction:(UIButton *)sender{
    
    [sender removeFromSuperview];
    
}


#pragma mark - UIScrollViewDelegate Methods

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (![scrollView isKindOfClass:[UICollectionView class]]) return;
    
    CGFloat horizontalOffset = scrollView.contentOffset.x;
    
    TCellCollectionView *collectionView = (TCellCollectionView *)scrollView;
    NSInteger index = collectionView.indexPath.row;
    self.contentOffsetDictionary[[@(index) stringValue]] = @(horizontalOffset);
}


@end
