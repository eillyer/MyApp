//
//  mm3.m
//  MyBaseApp
//
//  Created by julong on 2017/10/17.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import "mm3.h"
#import "RunLoopVC.h"


#import "ARViewController.h"

//AR应用必须在手机上面弄，而且iOS11.1，iPhone6s及以上机型
//#import "ARViewController.h"
//http://code.cocoachina.com/view/136460  地球仪 swift


//#import "NFCViewController.h"

#import "runtimeVC.h"

@interface mm3 ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray * arr;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation mm3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _arr = [NSMutableArray new];

    
    [_arr addObjectsFromArray:@[@"runloop",@"runtime",@"AR体验",@"NFC"]];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.tableView reloadData];
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
    
    if ([_arr[indexPath.row] isEqualToString:@"runloop"]) {
        RunLoopVC *vc = [RunLoopVC new];
        vc.title = @"RunLoopVC";
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([_arr[indexPath.row] isEqualToString:@"runtime"]) {
        runtimeVC *vc = [runtimeVC new];
        vc.title = @"runtime";
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if ([_arr[indexPath.row] isEqualToString:@"AR体验"]) {
        ARViewController *vc = [ARViewController new];
        vc.title = @"AR体验";
        [self.navigationController pushViewController:vc animated:YES];
    }
    
//    if ([_arr[indexPath.row] isEqualToString:@"NFC"]) {
//        NFCViewController *vc = [NFCViewController new];
//        vc.title = @"NFC";
//        [self.navigationController pushViewController:vc animated:YES];
//    }
    
    
    
}


@end
