//
//  MJReashVC.m
//  MyBaseApp
//
//  Created by julong on 2017/10/17.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import "MJReashVC.h"

@interface MJReashVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray * arr;

@end

@implementation MJReashVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the
    _arr = [NSMutableArray new];
    for (int i = 0; i < 5; i++) {
        [_arr addObject:[NSString stringWithFormat:@"刷新测试 %d",i+1]];
    }
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [Utility addMJRefreshForTableView:self.tableView MJType:allType headerAction:^{
        NSLog(@"头部刷新");
        [_arr removeLastObject];
        
//        [NSThread sleepForTimeInterval:1.0];
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    } footAction:^{
        NSLog(@"地不刷新");
        [_arr addObject:@"添加"];
//        [NSThread sleepForTimeInterval:1.0];
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
        [self.tableView reloadData];

    }];
    
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



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
