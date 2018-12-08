//
//  RunLoopVC.m
//  APP
//
//  Created by julong on 2017/10/26.
//  Copyright © 2017年 eillyer. All rights reserved.
//
/*
 tableView中加载很多图片的时候主线程卡顿情况
 
 
 方法1：
    当显示cell中的图片的时候让加载图片这一步在串行队列中去干
    如：
        dispatch_queue_t serielQueue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_SERIAL);
            dispatch_sync(serielQueue, ^{
            调用方法
                cell.image = [UIImage imageWithUrl:@"www.baidu.com.jpg"];
        });
 
 方法2：
    tableView设置一个delagte，当滑动的时候，不去设置网络请求去加载图片，当停止滑动的时候，把当前显示的cell的图片加载出来
 
 
 方法3：
    使用runloop
    当滑动的时候设置runloop；设置图片是放在runloop的NSDefaultRunloopMode；意味着，当滑动的时候是在主线程中，runloop是不会调NSDefaultRunloopMode，当停止滑动时（主线程停止了），NSDefaultRunloopMode才会被执行。
 
    如： 需要再详解一下
        UIImage *downLoadImage = ...
        [self.avatarImageView performSelector:@selector(@setImage:) 设置图片
                              withObject:downLoadImage              哪个图片
                              afterDelay:0                          执行时间
                              inModes:@[NSDefaultRunLoopMode]];     runloop的模式
 */



/*
 让crash的app回光返照
 
 
        CFRunLoopRef runloop = CFRunLoopGetCurrent();//获取当前runloop
        NSArray *allRunLoopModes = CFBridgingRelease(CFRunLoopCopyAllModes(runloop));//得到现在runloop的说有模式
        while (1) {
            for (NSString *mode in allRunLoopModes) {//遍历所有模式mode看看那个模式
                CFRunLoopRunInMode((CFStringRef)mode, 0.001, false);
            }
        }
 
 
 */

/*
 Autorelease 自动释放池的释放
 
 在runloop执行下一次的时候runloop看这个池子中有没有用的，没用的就直接释放掉。
 
 */

#import "RunLoopVC.h"

@interface RunLoopVC ()

@property (nonatomic,strong) dispatch_source_t time;

@end

@implementation RunLoopVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //GCD没有用到runloop
//    [self setGCD];
    
    
    //runloop的各种模式
    [self timerSeting];
    
    
    
    
//    exit(1);
}

- (void)timerSeting{
    //1，默认帮你将timerj加入到runloop中(defualMode)
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeMethod) userInfo:nil repeats:YES];
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timeMethod) userInfo:nil repeats:YES];
    /*
     runloop的模式
        NSDefaultRunLoopMode    ：runloop的默认模式，只要有事件就处理
        UITrackingRunLoopMode   ：(优先切换)此模式就是当UI事件交互的时候runloop切换到的模式
        NSRunLoopCommonModes    ：占位符。在默认模式和tracking下
     
     */
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    
}

- (void)setGCD{
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    //创建一个定时器
    self.time = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //设置timer GCD 时间单位为纳秒
    dispatch_source_set_timer(self.time, DISPATCH_TIME_NOW, 1.0*NSEC_PER_SEC, 0);
    //设置回调
    dispatch_source_set_event_handler(self.time, ^{
        NSLog(@"======= %@",[NSThread currentThread]);
    });
    //启动
    dispatch_resume(self.time);
    
    
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}


- (void)timeMethod{
    static int i = 0;
    //主：
    GGLog(@"%@  %d",[NSThread currentThread] ,i++);
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
