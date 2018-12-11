//
//  AdvertisView.m
//  Potatso
//
//  Created by Potatso on 2018/11/19.
//  Copyright © 2018 TouchingApp. All rights reserved.
//

#import "AdvertisView.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"
@interface AdvertisView ()
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *timelabel;

@property (nonatomic,assign)NSInteger time;
@property (nonatomic,strong)NSTimer *timer;

@property (nonatomic,assign) BOOL isVideo;

@end

@implementation AdvertisView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


- (void)removeFromSuperview{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"videoAD" object:nil userInfo:nil];

    [super removeFromSuperview];
}


//- (void)layoutSubviews{
//    [super layoutSubviews];
//    if (self.isVideo) {
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"videoADstar" object:nil userInfo:nil];
//    }
//}
+(AdvertisView *)CustomView{
    //我们这里需要把这个xib加载出来而这个xib的所拥有者就是当前的对象`instantiateWithOwner:`这个方法就是对此xib文件进行拥有者关联，关联这个xib是属于哪一个类的我们当然这是self
    AdvertisView *View = [[UINib nibWithNibName:@"AdvertisView" bundle:nil]instantiateWithOwner:self options:nil].lastObject;
    View.timelabel.layer.masksToBounds = YES;
    View.timelabel.layer.cornerRadius = View.timelabel.frame.size.height/2;
    View.timelabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    return View;
}


- (void)showtime:(NSInteger)time image:(NSString *)image frame:(CGRect)frame inview:(UIView *)inView{
    [self.image sd_setImageWithURL:[NSURL URLWithString:image]];
    self.time = time;
//    self.frame = frame;
    [inView addSubview:self];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
//
//        if (@available(iOS 11.0, *)) {
//            UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
//            if (mainWindow.safeAreaInsets.bottom > 0.0) {
//                if (inView.height == DEVICE_HEIGHT) {
//                    make.left.right.mas_equalTo(0);
//                    make.top.mas_equalTo(44);
//                    make.bottom.mas_equalTo(-34);
//                }
//            }
//        }
    }];
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];


//    [self startTimeAction:@"" nowTime:@"" allTime:@""];
    
    
}

- (void)showtime:(NSInteger)time image:(NSString *)image frame:(CGRect)frame inview:(UIView *)inView isvideo:(BOOL)isVideo{

    [self.image sd_setImageWithURL:[NSURL URLWithString:image]];
    self.time = time;
    [inView addSubview:self];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    self.isVideo = isVideo;
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerActionssss) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"videoADstar" object:nil userInfo:nil];
}

- (void)timerActionssss{
    self.timelabel.text = [NSString stringWithFormat:@"%ld s",self.time];
    if (self.time <= 0) {
        self.surperTableView.scrollEnabled = YES;
        self.surperTableView.userInteractionEnabled = YES;

        [[NSNotificationCenter defaultCenter] postNotificationName:@"videoAD" object:nil userInfo:nil];
        [self.timer invalidate];
        self.timer = nil;
        self.timelabel.text = nil;
        if (self.isVideo) {
            [self removeFromSuperview];
        }
    }else{
        self.surperTableView.scrollEnabled = NO;
        self.time--;
    }
    
}

- (void)timerAction{
        self.timelabel.text = [NSString stringWithFormat:@"%ld s",self.time];
     if (self.time <= 0) {
         self.surperTableView.scrollEnabled = YES;
         self.surperTableView.userInteractionEnabled = YES;

         [[NSNotificationCenter defaultCenter] postNotificationName:@"videoAD" object:nil userInfo:nil];
         [self.timer invalidate];
         self.timer = nil;
         self.timelabel.text = nil;
         
         [UIView animateWithDuration:1.5 animations:^{
             self.alpha = 0;
         }];
         
         __weak typeof (self)  weakSelf = self;
         dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC));
         dispatch_after(delayTime, dispatch_get_main_queue(), ^{
             [weakSelf removeFromSuperview];

         });

     }else{
         self.surperTableView.scrollEnabled = NO;

         self.time--;

     }
}


- (IBAction)btn:(id)sender {
    
    if (!self.url.length) {
        return;
    }
    NSLog(@"前往广告%@",self.url);
    NSURL *urls = [NSURL URLWithString:self.url];
    if ( [[UIApplication sharedApplication] canOpenURL:urls]) {
        [[UIApplication sharedApplication] openURL:urls];
    }
}

+ (void)animationAlert:(UIView *)view
{
    
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = 0.4;
//    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
//                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
//                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
//                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
//    popAnimation.keyTimes = @[@0.0f, @0.5f, @0.75f, @1.0f];
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DIdentity],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.75f, 0.75f, 0.75f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5f, 0.5f, 0.5f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
                            ];
    popAnimation.keyTimes = @[@1.0f,@0.75f,@0.5f,@0.0f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [view.layer addAnimation:popAnimation forKey:nil];
}


@end
