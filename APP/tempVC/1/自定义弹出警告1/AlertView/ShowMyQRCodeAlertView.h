//
//  ShowMyQRCodeAlertView.h
//  Share365
//
//  Created by eillyer on 2017/12/9.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowMyQRCodeAlertView : UIView


@property (weak, nonatomic) IBOutlet UIView *BGvIEW;
@property (weak, nonatomic) IBOutlet UIView *allView;

@property (weak, nonatomic) IBOutlet UIView *topView;

@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UIButton *action;

@property (weak, nonatomic) IBOutlet UIButton *cancel;

@property (weak, nonatomic) IBOutlet UILabel *title;


- (void)show;

@end
