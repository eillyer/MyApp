//
//  CellAddCollectionView.m
//  MyBaseApp
//
//  Created by julong on 2017/10/17.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import "CellAddCollectionView.h"
#import "MyTableAndCollectionVC.h"
@interface CellAddCollectionView ()

@end

@implementation CellAddCollectionView

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationController pushViewController:[MyTableAndCollectionVC new] animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
