//
//  UserServiceAllTypeView.m
//  Share365
//
//  Created by eillyer on 2017/11/15.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#define KBtnH 40

#import "UserServiceAllTypeView.h"
@interface UserServiceAllTypeView ()

@property (nonatomic,strong) NSArray *typeArr;
@property (nonatomic,strong) NSMutableArray *tempArr;//已有的尺寸
@property (nonatomic,strong) NSDictionary *centerDict;


@end
@implementation UserServiceAllTypeView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

//    [self provisions:rect];//固定样式
    [self randomSet:rect];//随机
    
}
//随机分配
- (void)randomSet:(CGRect)rect{
    
    NSInteger i = 0;
    
    NSArray *colorStrArray = @[@0xfc9d01,@0xff5418,@0x01abf8,@0x0cba8c,@0xd398d2,@0xff376f,@0xbbd50d,@0xfc9d01,@0xff5418,@0x01abf8,@0x0cba8c,@0xd398d2,@0xff376f,@0xbbd50d,@0xfc9d01,@0xff5418,@0x01abf8,@0x0cba8c,@0xd398d2,@0xff376f,@0xbbd50d];
    
    for (NSString *name in self.typeArr) {

        UIColor *color = UIColorFromHex([colorStrArray[i] intValue]);
        i++;

        int bugnum = 1;
        CGFloat wid = [self widForString:name] +20;
        NSString *xx = [NSString stringWithFormat:@"%.f",rect.size.width-wid-20];
        NSString *yy = [NSString stringWithFormat:@"%.f",rect.size.height-KBtnH];
        int x = 0;
        int y = 0;
        do {
//            NSLog(@"%d",bugnum);
            if (bugnum == 300) {
                break;
            }else{
                bugnum++;
            }
            int Vx = [xx intValue];
            int rx = arc4random() % Vx;
            int Vy = [yy intValue];
            int ry = arc4random() % Vy;
            x = rx;
            y = ry;
        } while ([self isOccupancy:CGRectMake(x,y,wid+20,KBtnH)]);
//        if (bugnum == 1) {
//            x = 1;
//            y = 1;
//            bugnum = 2;
//        }else{
//            do {
//                int Vx = [xx intValue];
//                int rx = arc4random() % Vx;
//                int Vy = [yy intValue];
//                int ry = arc4random() % Vy;
//                x = rx;
//                y = ry;
//            } while ([self isOccupancy:CGRectMake(x,y,wid+20,KBtnH)]);
//        }

//        UIColor *color = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(x,y,wid+20,KBtnH)];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:name forState:UIControlStateNormal];
        [btn setR:20 wid:2 color:color];
        [btn setTitleColor:color forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        if (bugnum != 300) {
            [self.tempArr addObject:btn];
            [self addSubview:btn];
        }
    }
    
    //取得字符长度
    //计算btn宽度
    //给定随机x，y
    //判定是否超屏幕
    //超屏幕重新随机
    //没超屏幕加入view中
    //将btn的区域限定并且加宽高
    //第二组继续
    
    //    //随机数
    //    int Vx = ilogbf(rect.size.width);
    //    int x = arc4random() % Vx;
    //    //随机色
    //    [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
    
    
    
}

//规定分配
- (void)provisions:(CGRect)rect{

}

- (void)btnAction:(UIButton *)sender{
    NSLog(@"+++++%@",sender.titleLabel.text);
}

- (instancetype)initWithFrame:(CGRect)frame
                forAllTypeArr:(NSArray *)typeArr{
    self = [super initWithFrame:frame];

    self.backgroundColor = [UIColor whiteColor];
    self.typeArr = [NSArray arrayWithArray:typeArr];
    return self;
}

//计算宽度

- (float) widForString:(NSString *)value{
    
    UITextView *detailTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 0, KBtnH)];
    detailTextView.font = SYSFONT(16);
    detailTextView.text = value;
    CGSize deSize = [detailTextView sizeThatFits:CGSizeMake(CGFLOAT_MAX,KBtnH)];
    return deSize.width;
}

//判断是否站位
- (BOOL)isOccupancy:(CGRect)rect{
    BOOL isNO = NO;
//    int a = 0;
    for (UIView *btn in self.tempArr) {
        CGRect btnF = btn.frame;
        isNO = CGRectIntersectsRect(btnF, rect);
//        NSLog(@"%d",a++);
        if (isNO) {
//            NSLog(@"+++++++++++++++++++++++");
            return isNO;
        }
    }
//    NSLog(@"+++++++++++++++++++++++");
    return isNO;
}

- (NSMutableArray *)tempArr{
    if (!_tempArr) {
        _tempArr = [NSMutableArray new];
    }
    return _tempArr;
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    UITouch *touch = [[event allTouches] anyObject];
//    CGPoint p = [touch locationInView:self];
//
//    BOOL isNO = CGRectContainsPoint(CGRectMake(100, 100, 100, 60),p);
//
//    NSLog(@"%d",isNO);
//
//    NSLog(@"%f,%f",[touch locationInView:self].x,[touch locationInView:self].y);
//}
@end
