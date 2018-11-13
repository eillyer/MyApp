//
//  Cuart2DVC.m
//  APP
//
//  Created by eillyer on 2018/1/13.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "Cuart2DVC.h"
#import "A1.h"
#import "MainCell.h"
#import "LYLSystemTools.h"
@interface Cuart2DVC ()

@property (weak,nonatomic) IBOutletCollection(UIView) NSArray * bvIEW ;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong) NSArray * arr;

@property (nonatomic,strong) LYLSystemTools *a;
@end

@implementation Cuart2DVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.tableView registerClass:[MainCell class] forCellReuseIdentifier:@"cellss"];
    _arr = @[@{@"name":@"园->三角->水->欢迎",@"vc":@"WelcomeAminVC"}];

}
- (IBAction)A1:(id)sender {

}

#pragma mark - tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellss" forIndexPath:indexPath];
    cell.textLabel.text = _arr[indexPath.row][@"name"];
    cell.Identifier = _arr[indexPath.row][@"vc"];
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    MainCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    UIViewController *vc = [[NSClassFromString(cell.Identifier) alloc] init];
//    vc.title = cell.dict[@"name"];
//    vc.view.backgroundColor = [UIColor whiteColor];
//    [self.navigationController pushViewController:vc animated:YES];
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    [_bvIEW[1] worningShake];

//    [self.view worningShake];
    _a = [[LYLSystemTools alloc] initWithDistanceSensing];
    _a.sendLYLSystemTool = ^(NSDictionary *dict) {
        NSLog(@"%@", dict);
    };

    
}


@end
