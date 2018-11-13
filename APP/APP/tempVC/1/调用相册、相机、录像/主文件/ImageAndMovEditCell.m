//
//  ImageAndMovEditCell.m
//  APP
//
//  Created by julong on 2017/10/25.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import "ImageAndMovEditCell.h"

#import <UIImageView+WebCache.h>
#import "UIImage+image.h"
@interface ImageAndMovEditCell()

@property (weak, nonatomic) IBOutlet UIButton *delateBtn;

@property (weak, nonatomic) IBOutlet UIImageView *playImage;
@property (weak, nonatomic) IBOutlet UIImageView *BGImage;

@end


@implementation ImageAndMovEditCell

- (void)awakeFromNib {
    [super awakeFromNib];

    //分支看是图片还是地址
    if (self.theImage) {//表示图片
        //数据类型
        [self.playImage setHidden:YES];
//        [self.palyBtn setHidden:YES];
        self.BGImage.image = self.theImage;

    }else{//连接
        //判断mp4还是图片
        //按钮处理
        if ([self.url hasPrefix:@".png"] || [self.url hasPrefix:@".jpg"] || [self.url hasPrefix:@".bmp"] || [self.url hasPrefix:@".jpeg"] || [self.url hasPrefix:@".gif"]){//表示图片
            //隐藏paly按钮，添加背景图片
            [self.playImage setHidden:YES];
//            [self.palyBtn setHidden:YES];
            [self.BGImage sd_setImageWithURL:[NSURL URLWithString:self.url]];
            
        }else{
            [self.playImage setHidden:YES];
            //需要处理视频截图问题
            self.BGImage.image = [UIImage imageWithColor:[UIColor blackColor]];
            [self.playImage setHidden:NO];
//            [self.palyBtn setHidden:NO];
        }
    }
}

- (IBAction)remove:(id)sender {
    //删除
    
    self.sendImageAndMovEditCellBlack(YES, NO, self.row);
}

- (void)setDict:(NSDictionary *)dict{
    _dict = dict;
    
    //判断数据源
    
    //网络数据：字符串
    if ([dict[@"data"] isKindOfClass:[NSString class]]) {
        NSString *url = dict[@"data"];

        if ([url hasSuffix:@".png"] || [url hasSuffix:@".jpg"] || [url hasSuffix:@".bmp"] || [url hasSuffix:@".jpeg"] || [url hasSuffix:@".gif"]){//表示图片
            //隐藏paly按钮，添加背景图片
            [self.playImage setHidden:YES];
            //            [self.palyBtn setHidden:YES];
            
            [self.BGImage sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"anno"]];
            
        }else{
            [self.playImage setHidden:YES];
            //需要处理视频截图问题
            self.BGImage.image = [UIImage imageWithColor:[UIColor blackColor]];
            [self.playImage setHidden:NO];
            //            [self.palyBtn setHidden:NO];
        }
    }else if ([dict[@"data"] isKindOfClass:[UIImage class]]) {
        //图片资源
        [self.playImage setHidden:YES];
        self.BGImage.image = dict[@"data"];
    }else{
        //视频资源
        [self.playImage setHidden:YES];
        //需要处理视频截图问题
        self.BGImage.image = [UIImage imageWithColor:[UIColor blackColor]];
        [self.playImage setHidden:NO];
    }
    
    
}

- (void)setNoDelate:(BOOL)noDelate{
    _noDelate = noDelate;
    [self.delateBtn setHidden:noDelate];
}

@end
