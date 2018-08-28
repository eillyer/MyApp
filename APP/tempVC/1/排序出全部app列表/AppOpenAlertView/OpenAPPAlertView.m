//
//  OpenAPPAlertView.m
//  com.homing.alwayshome
//
//  Created by julong on 2017/5/30.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#import "OpenAPPAlertView.h"
#import "MyAppManager.h"
#import "HomeMainCell.h"
#import "HomeFlowLayout.h"
#import "UIImageView+WebCache.h"

#define kAlertWid kScreenWidth-40
#define kTitleFontSize 17
#define kContentFontSize 17
#define kImageHeight 150
#define kBtnHeight 50
#define kBtnWid 200
#define kBtnSp 10

@interface OpenAPPAlertView()<UICollectionViewDelegate,UICollectionViewDataSource>{
    UIView *_bgView;
    UIView *_alertView;
}
@property (nonatomic,strong) UICollectionView * collocationView;
@property (nonatomic,strong) NSMutableArray * arr;
@property (strong, nonatomic) MyAppManager *appManager;
@end


@implementation OpenAPPAlertView

- (instancetype)initWithFrame:(CGRect)frame
           WithCancelBtnTitle:(NSString *)cancelTitle{
    self = [super initWithFrame:frame];
    if (self) {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
        [self addSubview:_bgView];
        
        UIView *alertView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth-40, 255)];
        alertView.center = _bgView.center;
        [alertView setBackgroundColor:[UIColor whiteColor]];
//        alertView.layer.cornerRadius = 6*PX;
//        alertView.layer.masksToBounds = YES;
        [_bgView addSubview:alertView];
        
        _collocationView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(alertView.frame), 200) collectionViewLayout:[[HomeFlowLayout alloc] init]];
//        [_collocationView setCollectionViewLayout:[[HomeFlowLayout alloc] init]];

        
        UINib *nib = [UINib nibWithNibName:@"HomeMainCell" bundle:[NSBundle mainBundle]];
        [_collocationView registerNib:nib forCellWithReuseIdentifier:@"HomeMainCell"];
        _collocationView.delegate = self;
        _collocationView.dataSource = self;
        _collocationView.backgroundColor = [UIColor whiteColor];
        [self settingData];
        [alertView addSubview:_collocationView];

        
        UIButton *cancel = [[UIButton alloc] initWithFrame:CGRectMake(5,CGRectGetMaxY(_collocationView.frame)+5, alertView.frame.size.width-10,45)];
        [cancel addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
        [cancel setTitle:cancelTitle forState:UIControlStateNormal];
        cancel.backgroundColor = [UIColor lightGrayColor];
        [cancel setTitleColor:[UIColor blackColor] forState:0];
        
        
        [alertView addSubview:cancel];
        alertView.backgroundColor = [UIColor whiteColor];
        _alertView = alertView;
    }
    return self;
}
- (OpenAPPAlertView *)initWithwithCancelTitle:(NSString *)cancelTitle
                     WithCancelBlock:(void (^)())cancelBlock{
    OpenAPPAlertView *alretView = [self initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)     WithCancelBtnTitle:cancelTitle];
    _cancelActionBlock = cancelBlock;
    return alretView;
}

- (instancetype)initWithFrame:(CGRect)frame
              WithContentDict:(NSDictionary *)dict{
    self = [super initWithFrame:frame];
    if (self) {
        NSString *titleStr = dict[@"title"];
        NSString *contentStr = dict[@"content"];
        NSString *imageStr = dict[@"image"];
        NSString *btnStr = dict[@"btnStr"];
        
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
        [self addSubview:_bgView];
        
        CGSize titleSize = [titleStr boundingRectWithSize:CGSizeMake(kAlertWid-40, 1000000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kTitleFontSize]} context:nil].size;
//        CGSize titleSize = [titleStr sizeWithFont:[UIFont systemFontOfSize:kTitleFontSize] constrainedToSize:CGSizeMake(kAlertWid-40, 1000000) lineBreakMode:UILineBreakModeWordWrap];
        CGSize contentSize = [contentStr boundingRectWithSize:CGSizeMake(kAlertWid-40, 1000000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kContentFontSize]} context:nil].size;

        CGFloat height = titleSize.height+contentSize.height+kImageHeight+kBtnSp*2+kBtnHeight;
        CGFloat tempH = height>(kScreenHeight-100)?kScreenHeight-100:height;
        
        UIView *alertView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kAlertWid,tempH)];
        alertView.center = _bgView.center;
        [alertView setBackgroundColor:[UIColor whiteColor]];
        [_bgView addSubview:alertView];
        
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kAlertWid, kImageHeight)];
        [image sd_setImageWithURL:[NSURL URLWithString:imageStr]];
        image.contentMode = UIViewContentModeScaleToFill;
        [alertView addSubview:image];
        
        UIButton *cancel = [[UIButton alloc] initWithFrame:CGRectMake(0,0, 30,30)];
        [cancel addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
        [cancel setTitle:@"X" forState:UIControlStateNormal];
        [cancel setTintColor:[UIColor whiteColor]];
        cancel.center = CGPointMake(CGRectGetMaxX(alertView.frame), CGRectGetMinY(alertView.frame));
        cancel.layer.borderColor = [UIColor whiteColor].CGColor;
        cancel.layer.borderWidth = 1;
        cancel.layer.masksToBounds = YES;
        cancel.layer.cornerRadius = 15;
        cancel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        alertView.backgroundColor = [UIColor whiteColor];
        [_bgView addSubview:cancel];
        

        
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(image.frame), kAlertWid-40, titleSize.height)];
        title.textAlignment = NSTextAlignmentCenter;
        title.text = titleStr;
//        title.backgroundColor = [UIColor redColor];
        [alertView addSubview:title];
        
        
        if (tempH != height) {
            UITextView *content = [[UITextView alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(title.frame)+10, kAlertWid-40, tempH-kImageHeight-titleSize.height-kBtnHeight-kBtnSp*2-10)];
            content.font = [UIFont systemFontOfSize:kContentFontSize];
            content.textAlignment = NSTextAlignmentCenter;
//            content.lineBreakMode = NSLineBreakByWordWrapping;

            content.editable = NO;
            content.text = contentStr;
            [alertView addSubview:content];
        }else{
            UILabel *content = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(title.frame), kAlertWid-40, contentSize.height)];
            content.textAlignment = NSTextAlignmentCenter;
            content.text = contentStr;
            content.numberOfLines = 0;
            content.lineBreakMode = NSLineBreakByClipping;
//            content.lineBreakMode = UILineBreakModeWordWrap;

            [alertView addSubview:content];
        }
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(kBtnSp,tempH-kBtnSp, kAlertWid-2*kBtnSp,-kBtnHeight)];
        [btn addTarget:self action:@selector(noticeAction) forControlEvents:UIControlEventTouchUpInside];
        [btn setTintColor:[UIColor blackColor]];
        btn.backgroundColor = [UIColor colorWithRed:37.0/255 green:172.0/255 blue:211.0/255 alpha:1];
        [btn setTitle:btnStr forState:UIControlStateNormal];
        [alertView addSubview:btn];
        

        _alertView = alertView;
        
    }
    return self;
}


- (OpenAPPAlertView *)initWithwithContentDict:(NSDictionary *)dict
                                  cancelBlock:(void (^)())cancelBlock
                                  actionBlock:(void (^)())actionBlock{
    OpenAPPAlertView *alretView = [self initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)     WithContentDict:dict];
    _cancelActionBlock = cancelBlock;
    _noticeActionBlock = actionBlock;
//    actionBlock();
    return alretView;
}


+(void) animationAlert:(UIView *)view
{
    
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = 0.4;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAnimation.keyTimes = @[@0.0f, @0.5f, @0.75f, @1.0f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [view.layer addAnimation:popAnimation forKey:nil];
}

- (void)cancelAction{
    
    [self removeFromSuperview];
}



- (void)show{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [[self class] animationAlert:_alertView];
}


- (void)noticeAction{
    NSLog(@"点击按钮，跳转action");
    [self removeFromSuperview];

}

//获取app列表
- (void)settingData{
//    NSArray *appList = @[@{@"name":@"Facebook",@"url":@"fb://"},
//                         @{@"name":@"YouTube",@"url":@"youtube://"},
//                         @{@"name":@"Twitter",@"url":@"twitter://"},
//                         @{@"name":@"Gmail",@"url":@"googlegmail://"},
//                         @{@"name":@"Chrome",@"url":@"googlechrome://"},
//                         @{@"name":@"App Store",@"url":@"itms-apps://"}];
//    
//    [self.arr addObjectsFromArray:appList];
    
    [self.appManager scanApps];
    
    
    [self changeOrder];
    [self.collocationView reloadData];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _arr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeMainCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeMainCell" forIndexPath:indexPath];
    
    MyApp *app = _arr[indexPath.row];

//    NSDictionary *dict = _arr[indexPath.row];
    
//    cell.pid = dict[@"url"];
//    
//    cell.imageView.image = [UIImage imageNamed:dict[@"name"]];
//    cell.titleLabel.text = dict[@"name"];
    
    cell.imageView.image = [app iconImage];
    cell.titleLabel.text = [app localizedName];
    cell.pid = [app bundleIdentifier];
    
    
    cell.imageView.layer.masksToBounds = YES;
    cell.imageView.layer.cornerRadius = 10;
    
    
    
    return cell;
}



-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
//    HomeMainCell *cell = (HomeMainCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    
//    BOOL isOpen = (BOOL)[[UIApplication sharedApplication] openURL:[NSURL URLWithString:cell.pid]];
//    
//    
//    if (!isOpen) {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Application is not installed" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        [alert show];
//    }
    
    
//    HomeMainCell *cell = (HomeMainCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //    BOOL open = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:cell.pid]];
    //    BOOL open = (BOOL)[[UIApplication sharedApplication] openURL:[NSURL URLWithString:cell.pid]];
    //
    //    if (open) {
    //        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:cell.pid]];
    //
    //    }else{
    //        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"no app" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    //
    //        [alert show];
    //    }
    //
    
    
//    BOOL open = (BOOL)[[UIApplication sharedApplication] openURL:[NSURL URLWithString:cell.pid]];
//    
//    if (!open) {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Application is not installed" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        
//        [alert show];
//    }
    
    
    
    
    
    
        MyApp *app = _arr[ indexPath.row ];
        NSLog(@"name:%@",[app bundleIdentifier]);
        Class lsawsc = objc_getClass("LSApplicationWorkspace");
        NSObject* workspace = [lsawsc performSelector:NSSelectorFromString(@"defaultWorkspace")];
        [workspace performSelector:NSSelectorFromString(@"openApplicationWithBundleID:") withObject:[app bundleIdentifier]];
        [self.appManager openApp:app];
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"weixin://"]];
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"openAPP://com.sina.weibo"]];

    
    
}

- (void)changeOrder{
    //preferences array
    
    
    [self.arr addObjectsFromArray:self.appManager.apps];
    
//    NSArray *names = @[@"Facebook",@"YouTube",@"Twitter",@"Gmail",@"Chrome",@"Play Store"];
//    for (int i = 0; i < _arr.count; i++) {
//        MyApp *app = _arr[i];
//        NSString *name = [app localizedName];
//        if ([names containsObject:name]) {
//            [_arr exchangeObjectAtIndex:i withObjectAtIndex:0];
//        }
//    }
}
- (NSMutableArray *)arr{
    if (!_arr) {
        _arr = [NSMutableArray new];
    }
    return _arr;
}

- (MyAppManager *)appManager {
    if (!_appManager) {
        _appManager = [MyAppManager sharedManager];
        [_appManager scanApps];
    }
    return _appManager;
}

@end
