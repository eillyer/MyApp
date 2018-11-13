//
//  zhedietableView.m
//  MyBaseApp
//
//  Created by julong on 2017/10/17.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import "zhedietableView.h"

@interface zhedietableView ()<UITableViewDelegate,UITableViewDataSource>
{
    BOOL close[30];
    
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//@property (nonatomic,strong)NSMutableArray *arr;



@end

@implementation zhedietableView

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settingData];
    [self settingView];
    
    
    
}
- (void)settingData{
    
    
    //这个的目的是为了使得启动app时，单元格是收缩的
    for (int i=0; i<30; i++) {
        close[i] = YES;
    }
    
    
}
- (void)settingView{
    
    self.navigationItem.title = @"折叠表";
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0,0, 30,30)];
    [btn addTarget:self action:@selector(backVC) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"backBtn"] forState:0];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}
- (void)backVC{
    [self.navigationController popViewControllerAnimated:YES];
}

//折叠


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (close[section]) {
        return 0;
    }
    return 10;
}
//组头的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

//创建组头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    

    
    UIControl *view = [[UIControl alloc] initWithFrame:CGRectMake(0, 0,kScreenWidth, 50)];
    view.tag = 1000 + section;
    view.backgroundColor = [UIColor colorWithRed:0.849 green:0.195 blue:0.258 alpha:1.000];;
    [view addTarget:self action:@selector(sectionClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 4, 200, 30)];
    label.textColor = [UIColor colorWithRed:1.000 green:0.985 blue:0.996 alpha:1.000];
    label.font = [UIFont systemFontOfSize:14];
    label.text = [NSString stringWithFormat:@"头部 %ld",section];
    [view addSubview:label];
    
    view.layer.borderColor = [UIColor whiteColor].CGColor;
    view.layer.borderWidth = 1;
    
    
    
    return view;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    cell.textLabel.text = [NSString stringWithFormat:@"header:%ld , cell : %ld",indexPath.section,indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UIViewController *viewCtl = self.navigationController.viewControllers[2];
    
    [self.navigationController popToViewController:viewCtl animated:YES];
    
}

-(void)sectionClick:(UIControl *)view{
    
    
    //获取点击的组
    NSInteger i = view.tag - 1000;
    
    
    
    //取反
    close[i] = !close[i];
    //刷新列表
    NSIndexSet * index = [NSIndexSet indexSetWithIndex:i];
    [_tableView reloadSections:index withRowAnimation:UITableViewRowAnimationAutomatic];
    
}



//- (NSMutableArray *)arr{
//    if (!_arr) {
//        _arr = [NSMutableArray new];
//    }
//    return _arr;
//}


@end
