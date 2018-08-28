//
//  Utility.m
//  TableViewMJ
//
//  Created by julong on 2017/6/23.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#define kMJRefreshNameUp @"下拉刷新数据↓"
#define kMJRefreshNameDown @"点击加载更多"
#define kMJRefreshNameWait @"加载中..."
#define kMJRefreshNameNOData @"没有更多数据"
#define kMJRefreshNameReadly @"准备加载数据"


#import "Utility.h"
#import "MJRefresh.h"

#import "MBProgressHUD.h"
#import "AppDelegate.h"

#import "UserInfoModel.h"


/*
 //请求app的打分
 #import <StoreKit/StoreKit.h>
 [SKStoreReviewController requestReview];
 */

#define isiPhone ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)

@implementation Utility

+ (instancetype)sharedUtility{
    static Utility *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[Utility alloc] init];
    });
    return helper;
}

+ (void)addMJRefreshForTableView:(UITableView *)tableView
                          MJType:(MJTableViewType)type
                    headerAction:(void(^)())headerAction
                      footAction:(void(^)())footAction{
    
    MJRefreshGifHeader *header1 = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        headerAction();
    }];
    
    [header1 setTitle:kMJRefreshNameUp forState:MJRefreshStateIdle];
    [header1 setTitle:kMJRefreshNameWait forState:MJRefreshStateRefreshing];
    [header1 setTitle:kMJRefreshNameReadly forState:MJRefreshStatePulling];
    header1.lastUpdatedTimeLabel.hidden = YES;
    
    MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingBlock:^{
        footAction();
    }];
    [footer setTitle:kMJRefreshNameDown forState:MJRefreshStateIdle];
    [footer setTitle:kMJRefreshNameWait forState:MJRefreshStateRefreshing];
    [footer setTitle:kMJRefreshNameReadly forState:MJRefreshStatePulling];
    [footer setTitle:kMJRefreshNameNOData forState:MJRefreshStateNoMoreData];
    
    
    
    switch (type) {
        case allType:
            tableView.mj_footer = footer;
            tableView.mj_header = header1;
            break;
        case headerType:
            
            tableView.mj_header = header1;
            break;
        case footType:
            tableView.mj_footer = footer;
            break;
    }
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}




+ (void)showToastMessage:(NSString *)message
{
    
    if ([message isEqualToString:@"用户令牌不存在"]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateToken" object:@"用户令牌不存在" userInfo:nil];
        
        
    }
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:appDelegate.window
                                              animated:YES];
    if (!isiPhone) {
        hud.detailsLabelFont=[UIFont systemFontOfSize:25.0];
    }
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabelText = message;
    hud.margin = 10.f;
    hud.yOffset = 150.f;
    
    
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1.5];
}

+ (void) showAlertDialog:(UIViewController *)viewCtrl title:(NSString *)title message:(NSString *)message handler:(void (^)(UIAlertAction *action))handler
{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:handler]];
    
    [viewCtrl presentViewController:alertController animated:YES completion:nil];
}




+ (void)saveUserInfoModel:(NSDictionary *)dict{
    UserInfoModel *userModel = [UserInfoModel sharedUserInfoModel];
    //保存当前登陆者信息
    [userModel setValuesForKeysWithDictionary:dict];
    //>>>>>>>>>>>>>>>>可以建库存储各用户信息a
    
    //对象存储
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:userModel];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"UserInfoModel"];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isLogin"];
    
    
}

+ (void)cmdHideKeyboard:(UITextField*)_txtField {
    
    if (_txtField != nil && [_txtField isFirstResponder]) {
        [_txtField resignFirstResponder];
    }
    
}

+ (void)showToastImage{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    
    //添加webview
    UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [appDelegate.window addSubview:web];
    
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    image.image = [UIImage imageNamed:@"lauchimage"];
    
    
    [appDelegate.window addSubview:image];
    
    //直接再添加一个web页面
    //    //    __weak typeof (self) weakSelf = self;
    //    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.5 * NSEC_PER_SEC));
    //    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
    //
    //        [UIView animateWithDuration:2 animations:^{
    //            image.alpha = 0;
    //        }];
    //
    //
    //
    //        NSURL *url = [NSURL URLWithString:kUserInfo.url];
    //        NSURLRequest *req = [NSURLRequest requestWithURL:url];
    //        [web loadRequest:req];
    //        web.scalesPageToFit = YES;
    //    });
    
    
    
    
}

@end

