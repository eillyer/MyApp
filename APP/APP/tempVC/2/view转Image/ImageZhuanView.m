//
//  ImageZhuanView.m
//  APP
//
//  Created by eillyer on 2018/8/22.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "ImageZhuanView.h"

@interface ImageZhuanView ()
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIView *myview;
    
@end

@implementation ImageZhuanView
- (IBAction)jietu:(id)sender {
    //截图
//    UIView *view = [self.image snapshotViewAfterScreenUpdates:NO];
//    view.layer.masksToBounds = YES;
//    view.layer.cornerRadius = 0.0;
//    view.layer.shadowOffset = CGSizeMake(-5.0, 0.0);
//    view.layer.shadowRadius = 5.0;
//    view.layer.shadowOpacity = 0.4;
//
//
//    self.myview = view;


//    UIView *snap1 = [self.view snapshotViewAfterScreenUpdates:YES];
//    snap1.center = self.view.center;
//    [self.myview addSubview:snap1];
    
    self.image.image = [UIImage addImage:[UIImage imageNamed:@"koudai"] toImage:[UIImage imageNamed:@"move"]];
    
    
}
- (IBAction)viewToImage:(id)sender {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 500)];
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    [view addSubview:redView];
    
    UIView *redView1 = [[UIView alloc] initWithFrame:CGRectMake(200, 200, 100, 100)];
    redView1.backgroundColor = [UIColor redColor];
    [view addSubview:redView1];
    
    UIView *redView2 = [[UIView alloc] initWithFrame:CGRectMake(200, 0, 100, 100)];
    redView2.backgroundColor = [UIColor redColor];
    [view addSubview:redView2];
    
    UIView *redView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 100, 100)];
    redView3.backgroundColor = [UIColor redColor];
    [view addSubview:redView3];
    
    self.image.image = [UIImage imageWithView:view];
    
}
    
- (void)viewDidLoad {
    [super viewDidLoad];

    //1.注册通知截图的事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(screenShot) name:UIApplicationUserDidTakeScreenshotNotification object:nil];




}

- (void)screenShot
    {
        //每次截屏之前，删除之间添加的存放图片的imageView，不然重复截屏会不断的截取到之前的页面
//        [self.photoIV removeFromSuperview];
//        self.photoIV = nil;
        
        //截屏, 获取所截图片（imageWithScreenshot在后面实现）
//        UIImage *image = [self imageWithScreenshot];
//
//        //添加显示
////        UIImageView *photoIV = [[UIImageView alloc]initWithImage:image];
//        self.photoIV = photoIV;
//        photoIV.frame = CGRectMake(20, 50, [UIScreen mainScreen].bounds.size.width-40, [UIScreen mainScreen].bounds.size.height-100);
//
//        /*为imageView添加边框和阴影，以突出显示*/
//        //给imageView添加边框
//        CALayer * layer = [photoIV layer];
//        layer.borderColor = [[UIColor whiteColor] CGColor];
//        layer.borderWidth = 5.0f;
//
//        //添加四个边阴影
//        photoIV.layer.shadowColor = [UIColor blackColor].CGColor;
//        photoIV.layer.shadowOffset = CGSizeMake(0, 0);
//        photoIV.layer.shadowOpacity = 0.5;
//        photoIV.layer.shadowRadius = 10.0;
//        [self.view addSubview:photoIV];
//        //调用显示分享的页面
//        [self share];
        
        //第一中
        self.image.image = [self imageWithScreenshot];
        
        NSLog(@"截图成功");

}
    
    
- (UIImage *)imageWithScreenshot
    {
        
        //1.注册通知截图的事件 需要添加箭头事件
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(screenShot) name:UIApplicationUserDidTakeScreenshotNotification object:nil];
        
        CGSize imageSize = CGSizeZero;
        UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
        if (UIInterfaceOrientationIsPortrait(orientation))
        imageSize = [UIScreen mainScreen].bounds.size;
        else
        imageSize = CGSizeMake([UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
        
        UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
        CGContextRef context = UIGraphicsGetCurrentContext();
        for (UIWindow *window in [[UIApplication sharedApplication] windows])
        {
            CGContextSaveGState(context);
            CGContextTranslateCTM(context, window.center.x, window.center.y);
            CGContextConcatCTM(context, window.transform);
            CGContextTranslateCTM(context, -window.bounds.size.width * window.layer.anchorPoint.x, -window.bounds.size.height * window.layer.anchorPoint.y);
            if (orientation == UIInterfaceOrientationLandscapeLeft)
            {
                CGContextRotateCTM(context, M_PI_2);
                CGContextTranslateCTM(context, 0, -imageSize.width);
            }
            else if (orientation == UIInterfaceOrientationLandscapeRight)
            {
                CGContextRotateCTM(context, -M_PI_2);
                CGContextTranslateCTM(context, -imageSize.height, 0);
            } else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
                CGContextRotateCTM(context, M_PI);
                CGContextTranslateCTM(context, -imageSize.width, -imageSize.height);
            }
            if ([window respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
            {
                [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:YES];
            }
            else
            {
                [window.layer renderInContext:context];
            }
            CGContextRestoreGState(context);
        }
        
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        NSData *imageData = UIImagePNGRepresentation(image);
        
        return [UIImage imageWithData:imageData];
}
    
    
@end
