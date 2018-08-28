//
//  mm1.m
//  MyBaseApp
//
//  Created by julong on 2017/10/17.
//  Copyright © 2017年 eillyer. All rights reserved.
//
/*
 //https://github.com/fuzheng0301/FaceRecognition
 //项目地址⬆️
 
 //第二个识别
 //http://blog.csdn.net/u013263917/article/details/54973462
 
 //http://blog.csdn.net/wangrui13931182709/article/details/51682956

 
 */

#import "mm1.h"

#import "MJReashVC.h"
#import "CellAddCollectionView.h"
#import "zhedietableView.h"

#import "ZidingyiAlertVC1.h"
#import "OpenAPPAlertView.h"
#import "AddImageAndMp4VC.h"
#import "MapLocationVC.h"
#import "SoundPlayerVC.h"
#import "TimeChooseVC.h"

#import "The3DTouchViewController.h"

#import "ZhiwenshibieViewController.h"

#import "MapVC.h"

#import "CUSFrame.h"
#import "MyProgressVC.h"
#import "GyroscopeVC.h"


#import "GetBankCardNumber.h"
#import "Cuart2DVC.h"



#import <BmobSDK/Bmob.h>

#import "NewerHelpViewController.h"



@interface mm1 ()<UITableViewDataSource,UITableViewDelegate>{
    int num;
}
@property (nonatomic,strong) NSMutableArray * arr;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation mm1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0,0, 130,30)];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"看日志" forState:UIControlStateNormal];
    [btn setBackgroundColor:UIColorFromRGB(234,97,50,1)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    num = 1;
    _arr = [NSMutableArray new];
    [_arr addObjectsFromArray:@[@"上下刷新",
                                @"cell中添加图片处理",
                                @"可折叠表视图",
                                @"自定义弹出警告1",
                                @"自定义弹出警告2",
                                @"调用相册，照相机，录像",
                                @"时间选择器",
                                @"折线图，柱状图等",
                                @"动画演示",
                                @"定位",
                                @"发声",
                                @"登录页面",
                                @"欢迎页面",
                                @"model中的网络",
                                @"国际化",
                                @"监控设备状态(陀螺仪，耳机等)",
                                @"3D touch",
                                @"动态进度条",
                                @"陀螺仪检查",
                                @"二维码扫描，生成",
                                @"JS调用，html文件加载等",
                                @"排序出全部app列表",
                                @"小菊花和进度条",
                                @"指纹识别",
                                @"地图",
                                @"静态库",
                                @"相机识别银行卡",
                                @"相机识别图片2",
                                @"相机识别身份证",
                                @"图像捕捉",
                                @"银行卡号识别",
                                @"人脸识别",
                                @"引导页的新手指南",
                                @"待续。。。"]];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    

    
    
}
- (void)btnAction:(UIButton *)sender{
    
    if ([sender.titleLabel.text isEqualToString:@"看日志"]) {
        [sender setTitle:@"隐藏日志" forState:0];
        [[GHConsole sharedConsole] startPrintLog];
    }else{
//        [sender setTitle:@"看日志" forState:0];
        [[GHConsole sharedConsole] stopPringting];

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = _arr[indexPath.row];
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSString *str = _arr[indexPath.row];

    if ([str isEqualToString:@"引导页的新手指南"]) {
        NewerHelpViewController *vc = [NewerHelpViewController new];
        [self presentViewController:vc animated:YES completion:nil];

    }
//    if ([str isEqualToString:@"人脸识别"]) {
//        GetFaceIdVC *vc = [GetFaceIdVC new];
//        [self.navigationController pushViewController:vc animated:YES];
//    }
    if ([str isEqualToString:@"银行卡号识别"]) {
        GetBankCardNumber *vc = [GetBankCardNumber new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if ([str isEqualToString:@"动态进度条"]) {
        MyProgressVC *vc = [MyProgressVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if ([str isEqualToString:@"陀螺仪检查"]) {
        GyroscopeVC *vc = [GyroscopeVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if ([str isEqualToString:@"动画演示"]) {
        Cuart2DVC *vc = [Cuart2DVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
//    if ([str isEqualToString:@"相机识别银行卡"]) {
//        MyBankCordVC *vc = [MyBankCordVC new];
//        [self.navigationController pushViewController:vc animated:YES];
//    }
    
    if ([str isEqualToString:@"上下刷新"]) {
        MJReashVC *vc = [MJReashVC new];

        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if ([str isEqualToString:@"cell中添加图片处理"]) {
        CellAddCollectionView *vc = [CellAddCollectionView new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
    if ([str isEqualToString:@"可折叠表视图"]) {
        zhedietableView *vc = [zhedietableView new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if ([str isEqualToString:@"自定义弹出警告1"]) {
        ZidingyiAlertVC1 *vc = [ZidingyiAlertVC1 new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([str isEqualToString:@"排序出全部app列表"]) {
        OpenAPPAlertView *alert = [[OpenAPPAlertView alloc] initWithwithCancelTitle:@"cancel" WithCancelBlock:nil];
        [alert show];
    }

    if ([str isEqualToString:@"自定义弹出警告2"]) {
        NSDictionary *dict = @{@"title" : @"Title",
                               @"content" : @"content,content,content,content,content,content,content,content,content,content,content,content,content,content,content,content,content,contentcontent,content,content,content,content,content,content,content,content,content,content,content,content,content,content,content,content,contentcontent,content,content,content,content,content,content,content,content,content,content,content,content,content,content,content,content,contentcontent,content,content,content,content,content,content,content,content,content,content,content,content,content,content,content,content,contentcontent,content,content,content,content,content,content,content,content,content,content,content,content,content,content,content,content,contentcontent,content,content,content,content,content,content,content,content,content,content,content,content,content,content,content,content,contentcontent,content,content,content,content,content,content,content,content,content,content,content,content,content,content,content,content,contentcontent,content,content,content,content,content,content,content,content,content,content,content,content,content,content,content,content,contentcontent,content,content,content,content,content,content,content,content,content,content,content,content,content,content,content,content,content",
                               @"btnStr" : @"按钮的str",
                               @"image" : @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=891111098,1970722748&fm=80&w=179&h=119&img.JPEG"};
        OpenAPPAlertView *alert = [[OpenAPPAlertView alloc] initWithwithContentDict:dict cancelBlock:nil actionBlock:^{
            
            
            //        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"跳转动作");
            
            //        });
        }];
        
        [alert show];
    }

    if ([str isEqualToString:@"定位"]) {
        MapLocationVC *vc = [MapLocationVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
    if ([str isEqualToString:@"调用相册，照相机，录像"]) {
        AddImageAndMp4VC *vc = [AddImageAndMp4VC new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if ([str isEqualToString:@"发声"]) {
        SoundPlayerVC *vc = [SoundPlayerVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([str isEqualToString:@"时间选择器"]) {
        TimeChooseVC *vc = [TimeChooseVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if ([str isEqualToString:@"指纹识别"]) {
        ZhiwenshibieViewController *vc = [ZhiwenshibieViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if ([str isEqualToString:@"3D touch"]) {
        The3DTouchViewController *vc = [The3DTouchViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if ([str isEqualToString:@"地图"]) {
        MapVC *vc = [MapVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if ([str isEqualToString:@"静态库"]) {
        CUSFrame *vc = [CUSFrame new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    NSString *a = @"asdfasdf";
    [a ZhuanUTF8];
    
}

/*
 1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1050,1051,1052,1053,1054,1055,1057,1070,1071,1072,1073,1074,1075,1100,1101,1102,1103,1104,1105,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1150,1151,1152,1153,1154,1200,1201,1202,1203,1204,1205,1206,1207,1208,1209,1210,1211,1254,1255,1256,1257,1258,1259,1300,1301,1302,1303,1304,1305,1306,1307,1308,1309,1310,1311,1312,1313,1314,1315,1320,1321,1322,1323,1324,1325,1326,1327,1328,1329,1330,1331,1332,1333,1334,1335,1336,1350,1351,4095
 
 */


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
