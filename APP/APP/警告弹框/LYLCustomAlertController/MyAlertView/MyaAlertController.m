//
//  MyaAlertController.m
//  QualityCloud
//
//  Created by julong on 2017/4/12.
//  Copyright © 2017年 eillyer. All rights reserved.
//


#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//边距
#define kDistance 70
#define kCellHeight 45

#define KWIDTH ([UIScreen mainScreen].bounds.size.width-kDistance)



#import "MyaAlertController.h"

#import "MyAlertCell.h"


@interface MyaAlertController ()<UITableViewDelegate,UITableViewDataSource>



//@property (nonatomic,strong) NSString * titleName;
//@property (nonatomic,strong) NSString * titleName;
//@property (nonatomic,strong) NSString * titleName;
@property (nonatomic,strong) UITableView * tableView;





@end

@implementation MyaAlertController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];

    if (self.alertStyle == typeDown) {
        [self settingViewDown];
    }else{
        [self settingViewUp];
    }
    
}


+ (instancetype)alertTitle:(NSString *)title
               contentText:(NSString *)contentText
            actionTitleArr:(NSArray *)titleArr
                 alertType:(AlertStyle)alertType
                    action:(void(^)(NSInteger row1, NSString *title1))successBlock{
    MyaAlertController *vc = [[MyaAlertController alloc] init];
    vc.titleName = title;
    vc.titleArr = [NSArray arrayWithArray:titleArr];
    vc.alertStyle = alertType;
    
    vc.selectRow = ^(NSInteger row, NSString *title) {
        successBlock(row,title);
    };

    return vc;
}
- (void)alertTitle:(NSString *)title
               contentText:(NSString *)contentText
            actionTitleArr:(NSArray *)titleArr
                 alertType:(AlertStyle)alertType
                  delegate:(UIViewController *)VC
                    action:(void(^)(NSInteger row1, NSString *title1))successBlock{
    MyaAlertController *vc = [[MyaAlertController alloc] init];
    vc.titleName = title;
    vc.titleArr = [NSArray arrayWithArray:titleArr];
    vc.alertStyle = alertType;
    
    vc.selectRow = ^(NSInteger row, NSString *title) {
        successBlock(row,title);
    };
    
    [VC addChildViewController:vc];
    [VC.view addSubview:vc.view];
}

#pragma mark - tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kCellHeight;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyAlertCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyAlertCell"];

    cell.backgroundColor = indexPath.row%2?[UIColor groupTableViewBackgroundColor]:[UIColor whiteColor];
    cell.nameLabel.textColor = indexPath.row%2?[UIColor blackColor]:[UIColor grayColor];
    cell.nameLabel.text = self.titleArr[indexPath.row];

    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MyAlertCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    self.selectRow(indexPath.row, cell.nameLabel.text);
    [self cancelAction:nil];

}


//样式1
- (void)settingViewDown{
//    NSInteger heightCount = ((self.titleArr.count+2)*kCellHeight < (ScreenHeight-120))?(self.titleArr.count+2)*kCellHeight:ScreenHeight-120;
    
    CGSize size = [self.titleName sizeOfTextMaxSize:CGSizeMake(KWIDTH-30, 100000) font:[UIFont systemFontOfSize:17]];
    
    
    
    //容器
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth-kDistance, 2*kCellHeight+size.height + 30)];
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.center = self.view.center;
    [self.view addSubview:contentView];
    
    //主题
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, kCellHeight)];
    nameLabel.font = [UIFont systemFontOfSize:17];
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.text = @"提示";
    [nameLabel setCAColorStarColor:kColorStar endColor:kColorEnd Tdo:nil] ;
    [contentView addSubview:nameLabel];
    
    //副标题
    UILabel *name2Label = [[UILabel alloc] initWithFrame:CGRectMake(15, kCellHeight+15, KWIDTH-30, size.height)];
    //    name2Label.center = contentView.center;
    name2Label.font = [UIFont systemFontOfSize:17];
    name2Label.textColor = UIColorFromHex(0x666666);
    name2Label.textAlignment = NSTextAlignmentCenter;
    name2Label.numberOfLines = 0;
    name2Label.text = self.titleName;
//    name2Label.backgroundColor = UIColorFromHex(0x666666);
    [contentView addSubview:name2Label];


    double point = CGRectGetHeight(contentView.frame)-kCellHeight;

    if (self.titleArr.count == 1) {
        //确定
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0,point,KWIDTH,kCellHeight)];
        [btn addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:self.titleArr[0] forState:UIControlStateNormal];
        //    [btn setTintColor:kFWColorBorder];
        [btn setTitleColor:[UIColor blackColor] forState:0];
        [contentView addSubview:btn];
        
        //line
        UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, point, KWIDTH, 1)];
        line1.backgroundColor = kFWColorBorder;
        [contentView addSubview:line1];
        
    }else{
        //确定
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0,point,KWIDTH/2,kCellHeight)];
        [btn addTarget:self action:@selector(cancelAction1:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"确定" forState:UIControlStateNormal];
//        [btn setTintColor:UIColorFromHex(0x999999)];
        [btn setTitleColor:UIColorFromHex(0x999999) forState:0];
        [contentView addSubview:btn];
        
        
        
        //取消
        UIButton *cancel = [[UIButton alloc] initWithFrame:CGRectMake(KWIDTH/2,point, KWIDTH/2,kCellHeight)];
        [cancel addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
        [cancel setTitle:@"取消" forState:UIControlStateNormal];
//        [cancel setTintColor:UIColorFromHex(0x666666)];
        [cancel setTitleColor:UIColorFromHex(0x666666) forState:0];
        
        [contentView addSubview:cancel];
        
        //line
        UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, point, KWIDTH, 1)];
        line1.backgroundColor = kFWColorBorder;
        [contentView addSubview:line1];
        
        //line
        UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(KWIDTH/2,point, 1, kCellHeight)];
        line2.backgroundColor = kFWColorBorder;
        [contentView addSubview:line2];
    }
}



//样式二
- (void)settingViewUp{

    NSInteger heightCount = ((self.titleArr.count+1)*kCellHeight < (ScreenHeight-120))?(self.titleArr.count+1)*kCellHeight:ScreenHeight-120;

    //容器
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth-kDistance, heightCount)];
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.center = self.view.center;
    [self.view addSubview:contentView];
    
    //主题
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, kCellHeight)];
    nameLabel.font = [UIFont systemFontOfSize:17];
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.text = self.titleName;
    [nameLabel setCAColorStarColor:kColorStar endColor:kColorEnd Tdo:nil];
    [contentView addSubview:nameLabel];
    
    //取消按钮
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(7,7, kCellHeight+20,30)];
    [btn addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"取消" forState:UIControlStateNormal];
    [btn setTintColor:[UIColor whiteColor]];
    [contentView addSubview:btn];
    [btn setR:15 wid:1 color:[UIColor whiteColor]];
    
    //tableView
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kCellHeight, contentView.frame.size.width, contentView.frame.size.height-kCellHeight) style:UITableViewStylePlain];
     //可优化
    UINib *nib = [UINib nibWithNibName:@"MyAlertCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"MyAlertCell"];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [contentView addSubview:self.tableView];

}

//取消按钮
- (void)cancelAction:(UIButton *)sender{
    [self removeFromParentViewController];
    [self.view removeFromSuperview];
}
//确定按钮
- (void)cancelAction1:(UIButton *)sender{
    self.selectRow(0, @"确定");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self cancelAction:nil];
}

@end
