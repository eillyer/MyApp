//
//  ImageAndMovEditVC.m
//  APP
//
//  Created by julong on 2017/10/25.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import "ImageAndMovEditVC.h"
#import "ImageAndMovEditCellLayout.h"
#import "ImageAndMovEditCell.h"
#import "CameraAlertController.h"
#import "MediaPlayerVC.h"
#import <UIImageView+WebCache.h>

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kNumForLineCell 4

@interface ImageAndMovEditVC ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSArray *imageArrs;
    CGRect theFrame;
}
@property(nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray * imageArr;//照片
@property (nonatomic,strong) NSMutableArray * mp4Arr;//MP4
@property (nonatomic,assign) CGRect * frame;
@property (nonatomic,weak) UIViewController * superVC;
@property (nonatomic,assign) NSInteger number;
@property (nonatomic,assign) NSInteger height;
@property (nonatomic,assign) CGFloat ViewH;
@end
@implementation ImageAndMovEditVC

- (instancetype)initWithFrame:(CGRect)frame type:(theVCType)type superVC:(UIViewController *)vc theMaxNumber:(NSInteger)number dataArr:(NSArray *)dataArr{
    if (self = [super init]) {
        self.superVC = vc;
        self.number = number;
        self.theVCType = type;
        imageArrs = dataArr;
//        [vc addChildViewController:self];
        theFrame = frame;
        self.view.frame = frame;
        self.ViewH = frame.size.height;
        self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.imageArr addObject:[UIImage imageNamed:@"add"]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settingData];
    [self settingView];
}
- (void)settingData{
    [self.imageArr addObjectsFromArray:imageArrs];
}
- (void)settingView{
    ImageAndMovEditCellLayout * layout = [[ImageAndMovEditCellLayout alloc] initWithCount:kNumForLineCell];
    self.collectionView = [[UICollectionView alloc] initWithFrame:theFrame collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor clearColor];
    UINib *nib = [UINib nibWithNibName:@"ImageAndMovEditCell" bundle:[NSBundle mainBundle]];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"ImageAndMovEditCell"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
}

#pragma mark - collectionView delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //进行高度和count公式选择
    NSInteger a = self.imageArr.count/kNumForLineCell;
    NSInteger b = self.imageArr.count%kNumForLineCell;
    if (b != 0) {
        self.collectionView.frame = CGRectMake(theFrame.origin.x, theFrame.origin.y, theFrame.size.width, theFrame.size.height*(a+1));
        if (self.imageArr.count+1 < self.number) {
            self.sendImageAndMovEditHeightBlack(_ViewH*(a+1));
        }
    }else{
        self.collectionView.frame = CGRectMake(theFrame.origin.x, theFrame.origin.y, theFrame.size.width, theFrame.size.height*a);
        if (self.imageArr.count+1 < self.number) {
            self.sendImageAndMovEditHeightBlack(_ViewH*a);
        }
    }
    return self.imageArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ImageAndMovEditCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageAndMovEditCell" forIndexPath:indexPath];
    cell.dict = @{@"data":self.imageArr[indexPath.row]};
    cell.row = indexPath.row;
    //进行单个数据的删除操作
    cell.sendImageAndMovEditCellBlack = ^(BOOL isDelate, BOOL isPlay, NSInteger row) {
        //是否删除
        NSLog(@"isD :%d row :%ld",isDelate,row);
        [self.imageArr removeObjectAtIndex:row];
        [collectionView reloadData];
    };
    //多照片单视频
//    if (self.mp4Arr.count&&indexPath.row==(self.imageArr.count-1)) {
//        [cell setHidden:YES];
//    }else{
//        [cell setHidden:NO];
//    }
    
    //单照片单视频
    //    if (self.mp4Arr.count&&indexPath.row==(self.imageArr.count-1)) {
    //        [cell setHidden:YES];
    //    }else if(self.imageArr.count==2&&indexPath.row==1){
    //        [cell setHidden:YES];
    //
    //    }else{
    //        [cell setHidden:NO];
    //
    //    }
    
//    
//    if (self.mp4Arr.count) {
//        [cell.play setHidden:NO];
//    }else{
//        [cell.play setHidden:YES];
//    }
    
    //最后一个不要删除
    if (self.imageArr.count-1 == indexPath.row) {
        cell.noDelate = YES;
    }else{
        cell.noDelate = NO;
    }
    //规定最后一个添加按钮
//    if (self.imageArr.count==(self.number+1)&&indexPath.row==self.number&&self.number!=0) {
//        [cell setHidden:YES];
//    }
    //最后一个添加的优化
    if (indexPath.row+1 > self.number) {
        [cell setHidden:YES];
    }else{
        [cell setHidden:NO];
    }
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==(self.imageArr.count-1)) {
        //打开相册、录制视频
        CameraAlertController *alert = [CameraAlertController alertControllerWithTitle:@"提示" message:@"选择媒体方式" preferredStyle:0];
        
        alert.superVC = self;
        
        
        //进行输入媒体处理，是全照片还是视频还是混合
        /*
         AddImage,
         AddMp4,
         AddAll,
         EditImage,
         EditMp4,
         EditAll
         
         */
        switch (self.theVCType) {
            case AddAll:
                alert.mediaType = defaultType;
                break;
            case AddMp4:
                alert.mediaType = mp4Type;
                break;
            case AddImage:
                alert.mediaType = imageType;
                break;
            default:
                alert.mediaType = defaultType;
                break;
        }
        //之前版本
        /*
         if (self.imageArr.count==1&&!self.mp4Arr.count) {
         alert.mediaType = defaultType;
         }else if(!self.mp4Arr.count&&self.imageArr.count>1){
         alert.mediaType = imageType;
         }
         
         */

        
        alert.imageAndPath = ^(UIImage *image,NSString *path){
            if (path.length) {
                
                [self.mp4Arr addObject:path];
                self.sendImageAndMovBlack(image, path);
            }
            [self.imageArr addObject:image];
            [self.imageArr exchangeObjectAtIndex:self.imageArr.count-1 withObjectAtIndex:self.imageArr.count-2];
            
            [self.collectionView reloadData];
        };
        [self.navigationController presentViewController:alert animated:YES completion:nil];
        
    }else{
        //查看资料
        //网络数据：字符串
        if ([self.imageArr[indexPath.row] isKindOfClass:[NSString class]]) {
            NSString *url = self.imageArr[indexPath.row];

            if ([url hasSuffix:@".png"] || [url hasSuffix:@".jpg"] || [url hasSuffix:@".bmp"] || [url hasSuffix:@".jpeg"] || [url hasSuffix:@".gif"]){//表示图片
                //查看背景图片
                UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0,0, kScreenWidth,kScreenHeight)];
                [btn addTarget:self action:@selector(showImageAction:) forControlEvents:UIControlEventTouchUpInside];
                UIImageView *image = [[UIImageView alloc] initWithFrame:btn.frame];
                [image sd_setImageWithURL:[NSURL URLWithString:url]];
                [image addSubview:btn];
                [self.superVC.view addSubview:image];

                
            }else{
                //需要处理视频截图问题
                MediaPlayerVC *play = [[MediaPlayerVC alloc] init];
                
                play.videoURL = [NSURL URLWithString:url];
                [self.superVC.navigationController presentViewController:play animated:YES completion:nil];
            }
        }else if ([self.imageArr[indexPath.row] isKindOfClass:[UIImage class]]) {
            //图片资源
            //查看背景图片
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0,0, kScreenWidth,kScreenHeight)];
            [btn addTarget:self action:@selector(showImageAction:) forControlEvents:UIControlEventTouchUpInside];
            UIImageView *image = [[UIImageView alloc] initWithFrame:btn.frame];
            image.image = self.imageArr[indexPath.row];
            [image addSubview:btn];
            [self.superVC.view addSubview:image];
        }else{
            //视频资源
            MediaPlayerVC *play = [[MediaPlayerVC alloc] init];
            play.videoURL = [NSURL fileURLWithPath:self.imageArr[indexPath.row]];
            [self.superVC.navigationController presentViewController:play animated:YES completion:nil];
        }

        /*
         当前为图片直接点击删除
         if (!self.mp4Arr.count) {
         UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"编辑" message:@"是否删除照片？" preferredStyle:UIAlertControllerStyleAlert];
         UIAlertAction *dele = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
         [self.imageArr removeObjectAtIndex:indexPath.row];
         [self.collectionView reloadData];
         }];
         
         UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:0 handler:nil];
         [alert addAction:dele];
         [alert addAction:cancel];
         
         [self presentViewController:alert animated:YES completion:nil];
         }else{
         //播放视频
         MediaPlayerVC *play = [[MediaPlayerVC alloc] init];
         play.videoURL = [NSURL fileURLWithPath:self.mp4Arr[0]];
         [self.navigationController presentViewController:play animated:YES completion:nil];
         }
         
         */

    }
}

//图片展示
- (void)showImageAction:(UIButton *)sender{
    
    [sender removeFromSuperview];
}

- (NSMutableArray *)imageArr{
    if (!_imageArr) {
        _imageArr = [NSMutableArray new];
    }
    return _imageArr;
}

@end
