//
//  AdvertisView.h
//  Potatso
//
//  Created by Potatso on 2018/11/19.
//  Copyright © 2018 TouchingApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdvertisView : UIView

@property (nonatomic,strong) NSString * url;
@property (nonatomic,weak) UITableView *surperTableView;

+(AdvertisView *)CustomView;

- (void)showWithImage:(NSString *)imageUrlStr surperView:(UIView *)surperView;
- (void)showtime:(NSInteger)time image:(NSString *)image frame:(CGRect)frame inview:(UIView *)inView;

- (void)showtime:(NSInteger)time image:(NSString *)image frame:(CGRect)frame inview:(UIView *)inView isvideo:(BOOL)isVideo;
@end
