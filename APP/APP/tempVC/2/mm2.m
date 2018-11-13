//
//  mm2.m
//  MyBaseApp
//
//  Created by julong on 2017/10/17.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import "mm2.h"

#import "ZiyongfuwuqiVC.h"
//#import "ChatVC.h"
#import "KeyChainVC.h"
#import "ImageZhuanView.h"


@interface mm2 ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray * arr;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation mm2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _arr = [NSMutableArray new];

    
    [_arr addObjectsFromArray:@[@"自用服务器bmob和vpn",@"聊天",@"keyChain使用",@"view转image和手动截图"]];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.tableView reloadData];
    
    
    func();
}
void pr(int (^block)(void)){
    printf("%d\n",block());
}

void func (){
    int (^blocks[10])(void);
    int i;
    for (i = 0; i < 10; i++) {
        blocks[i] = ^{
            return i;
        };
    }
    for (int j = 0; j < 10; j++) {
        pr(blocks[j]);
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
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    /*
    if ([_arr[indexPath.row] isEqualToString:@"自用服务器"]) {
        ZiyongfuwuqiVC *vc = [ZiyongfuwuqiVC new];
        vc.title = @"自用后台服务器";
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if ([_arr[indexPath.row] isEqualToString:@"聊天"]) {
        ChatVC *vc = [ChatVC new];
        vc.title = @"聊天";
        [self.navigationController pushViewController:vc animated:YES];
    }
    */
    
    if ([_arr[indexPath.row] isEqualToString:@"自用服务器bmob和vpn"]) {
        ZiyongfuwuqiVC *vc = [ZiyongfuwuqiVC new];
        vc.title = @"自用服务器bmob和vpn";
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if ([_arr[indexPath.row] isEqualToString:@"keyChain使用"]) {
        KeyChainVC *vc = [KeyChainVC new];
        vc.title = @"keyChain使用";
        [self.navigationController pushViewController:vc animated:YES];
    }
//    @"view转image"
    if ([_arr[indexPath.row] isEqualToString:@"view转image和手动截图"]) {
        ImageZhuanView *vc = [ImageZhuanView new];
        vc.title = @"view转image";
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
    
    
    
    
}


@end
