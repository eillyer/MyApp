//
//  MyProgressVC.m
//  APP
//
//  Created by eillyer on 2018/1/11.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "MyProgressVC.h"
#import "LeafProgressView.h"

@interface MyProgressVC ()
@property (nonatomic, strong) LeafProgressView *progress;
@property (nonatomic, assign) CGFloat rate;
@end

@implementation MyProgressVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.progress = [[LeafProgressView alloc]initWithFrame:CGRectMake(36, 200, 248, 35)];
    [self.view addSubview:_progress];
    
    [_progress startLoading];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _rate += 0.01;
    
    [_progress setProgress:_rate];
    if (_rate >= 0.999) {
        _rate = 0 ;
        [_progress stopLoading];
    }
}

@end
