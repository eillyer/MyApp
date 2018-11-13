//
//  SelectAlertController.m
//  WeinanApp1
//
//  Created by julong on 2016/11/22.
//  Copyright © 2016年 eillyer. All rights reserved.
//

#import "SelectAlertController.h"

@interface SelectAlertController ()

@property (nonatomic,strong) NSString *chooseStr;

@end

@implementation SelectAlertController

- (void)viewDidLoad {
    [super viewDidLoad];


    
    if (self.showNameKey.length>0) {
        for (int i = 0; i < self.arr.count; i++) {
            
            NSDictionary *dict = [NSDictionary dictionaryWithDictionary:self.arr[i]];
            
            UIAlertAction *ac = [UIAlertAction actionWithTitle:dict[self.showNameKey] style:0 handler:^(UIAlertAction * _Nonnull action) {

                
                
                self.string(dict[self.showNameKey],dict);

            }];
            [self addAction:ac];
        }
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [self addAction:cancel];
    }else{
        for (int i = 0; i < self.arr.count; i++) {
            UIAlertAction *ac = [UIAlertAction actionWithTitle:self.arr[i] style:0 handler:^(UIAlertAction * _Nonnull action) {
                //            self.chooseStr = self.arr[i];
                
                
                self.string(self.arr[i],nil);
                ////            self.string = self.chooseStr;
                //            [self getStrBlock:^(NSString *str) {
                //
                //            }];
            }];
            [self addAction:ac];
        }
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [self addAction:cancel];
    }
    


}


- (NSMutableArray *)arr{
    if (!_arr) {
        _arr = [NSMutableArray new];
    }
    return _arr;
}
//- (void)getStrBlock:(void (^)(NSString *))str{
//    str(self.chooseStr);
//}

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
