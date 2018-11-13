//
//  CameraAlertController.m
//  WeinanApp1
//
//  Created by julong on 2016/11/22.
//  Copyright © 2016年 eillyer. All rights reserved.
//

#import "CameraAlertController.h"

#import "AVURLAsset+SetMp4.h"

#import "UIImage+image.h"

@interface CameraAlertController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation CameraAlertController

- (void)viewDidLoad {
    [super viewDidLoad];

    //打开相册、录制视频
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.delegate = self;
    [imagePicker setAllowsEditing:YES];//是否允许编辑
    
    UIAlertAction *pic = [UIAlertAction actionWithTitle:@"相册" style:0 handler:^(UIAlertAction * _Nonnull action) {
        //打开相册
        imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        [self.superVC presentViewController:imagePicker animated:YES completion:nil];
    }];
    UIAlertAction *pho = [UIAlertAction actionWithTitle:@"拍照" style:0 handler:^(UIAlertAction * _Nonnull action) {
        //拍照
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self.superVC presentViewController:imagePicker animated:YES completion:nil];
    }];
    UIAlertAction *mp4 = [UIAlertAction actionWithTitle:@"录像" style:0 handler:^(UIAlertAction * _Nonnull action) {
        //录像
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.mediaTypes = @[(NSString *)kUTTypeMovie];
        imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
        imagePicker.videoMaximumDuration = kTimeVideo;
        imagePicker.videoQuality = UIImagePickerControllerQualityType640x480;
        [self.superVC presentViewController:imagePicker animated:YES completion:nil];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    if (self.mediaType == defaultType) {
        [self addAction:pic];
        [self addAction:pho];
        [self addAction:mp4];
    }
    
    if (self.mediaType == imageType) {
        [self addAction:pic];
        [self addAction:pho];
    }
    
    if (self.mediaType == mp4Type) {
        [self addAction:mp4];
    }
    [self addAction:cancel];
}
#pragma mark - 相册的代理
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSString *mediaType=[info objectForKey:UIImagePickerControllerMediaType];
    NSLog(@"****************************%@",info);
    
    if([mediaType isEqualToString:(NSString *)kUTTypeMovie]){//如果是录制视频
        NSLog(@"video...");
        //        UIImage *image = [info objectForKey:UIImagePickerControllerLivePhoto];
        //        [self.imageArr addObject:image];
        NSURL *url=[info objectForKey:UIImagePickerControllerMediaURL];//视频路径
        UIImage *image = [UIImage getMOVImageWithUrl:url];
//        [self.imageArr addObject:image];
        NSLog(@"mp4:>>>>>>>>>>>>>>%@",info);
        NSString *mp4Path = [AVURLAsset setMp4FileUrl:url];
//        [self.mp4Arr addObject:mp4Path];
        self.imageAndPath(image,mp4Path);
        NSString *urlStr=[url path];
        if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(urlStr)) {
            //保存视频到相簿，注意也可以使用ALAssetsLibrary来保存
            UISaveVideoAtPathToSavedPhotosAlbum(urlStr, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);//保存视频到相簿
        }
    }else{
        UIImage *image = nil;
        if ([picker allowsEditing]) {//是否允许编辑
            image = [info objectForKey:UIImagePickerControllerEditedImage];
        }else{
            image = [info objectForKey:UIImagePickerControllerOriginalImage];
        }
        
//        [self.imageArr addObject:image];
        UIImage *endimage = [UIImage imageWithcompressImage:image toTargetWidth:300];
        self.imageAndPath(endimage,@"");
        
    }
    NSLog(@"mp4:>>>>>>>>>>>>>>%@",info);
    
    
//    [self.imageArr exchangeObjectAtIndex:self.imageArr.count-1 withObjectAtIndex:self.imageArr.count-2];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
//    [self.imageCollectionView reloadData];
////    NSInteger i = self.imageArr.count;
//    NSInteger number = i%4?(i/4+1):i/4;
//    self.viewHeight.constant = kHeight + (kScreenWidth/4-25)*number;
}

- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error) {
        NSLog(@"保存视频过程中发生错误，错误信息:%@",error.localizedDescription);
    }else{
        NSLog(@"视频保存成功.");
        //录制完之后自动播放
        //        NSURL *url=[NSURL fileURLWithPath:videoPath];
        //        _player=[AVPlayer playerWithURL:url];
        //        AVPlayerLayer *playerLayer=[AVPlayerLayer playerLayerWithPlayer:_player];
        //        playerLayer.frame=self.photo.frame;
        //        [self.photo.layer addSublayer:playerLayer];
        //        [_player play];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
