//
//  TimeChooseVC.m
//  APP
//
//  Created by julong on 2017/10/26.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import "TimeChooseVC.h"
#import "DatePickerView.h"
#import "SelectAlertController.h"
@interface TimeChooseVC ()
@property (nonatomic,strong) DatePickerView * datePicker;//时间选择
@property (nonatomic,strong) UIView * dateView;//时间View
@end

@implementation TimeChooseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.datePicker = [[DatePickerView alloc] initWithCustomeHeight:250];
    UIView *BGView= [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    BGView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    
    self.dateView = BGView;
    
    self.datePicker.center = self.dateView.center;
    [self.dateView addSubview:self.datePicker];
    [self.view addSubview:self.dateView];
    self.dateView.hidden = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)time1:(id)sender {
    
    self.dateView.hidden = NO;
    __weak typeof (self) weakSelf = self;
    self.datePicker.confirmBlock = ^(NSString *choseDate, NSString *restDate) {
        
        //        weakSelf.birthDayTf.text = choseDate;//选择的生日
        //        [sender setTitle:choseDate forState:UIControlStateNormal];
        //        weakSelf.dateLabel.text = choseDate;
        //        weakSelf.restDateLable.text = restDate;//计算出剩余的天数
        
        NSLog(@"%@=======%@",choseDate,restDate);
        
        weakSelf.dateView.hidden = YES;
        
    };
    self.datePicker.cannelBlock = ^(){
        
        weakSelf.dateView.hidden = YES;
        
    };
}
- (IBAction)time2:(id)sender {
    
    //天气
    
    SelectAlertController *alert = [SelectAlertController alertControllerWithTitle:@"提示" message:@"请选择天气" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert.arr addObjectsFromArray:@[@"阴转小雨",@"阴天",@"小雨",@"中雨",@"大雨",@"晴天",@"多云",@"雪",@"雾霾"]];
    
    alert.string = ^(NSString *str,NSDictionary *dic){
        NSLog(@"=======%@",str);
        NSLog(@"=======%@",dic);
    };
    
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}
- (IBAction)time3:(id)sender {
}
- (IBAction)time4:(id)sender {
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
