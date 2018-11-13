//
//  AVURLAsset+SetMp4.m
//  FriendWay_v_1.0.1
//
//  Created by julong on 2016/10/13.
//  Copyright © 2016年 eillyer. All rights reserved.
//

#import "AVURLAsset+SetMp4.h"

#import "NSString+NowDate.h"

@implementation AVURLAsset (SetMp4)

+ (NSString *)setMp4FileUrl:(NSURL *)url{
    AVURLAsset *avAsset = [AVURLAsset URLAssetWithURL:url options:nil];
    NSArray *compatiblePresets = [AVAssetExportSession exportPresetsCompatibleWithAsset:avAsset];
    
    if ([compatiblePresets containsObject:AVAssetExportPresetLowQuality])
        
    {
        
        AVAssetExportSession *exportSession = [[AVAssetExportSession alloc]initWithAsset:avAsset presetName:AVAssetExportPresetPassthrough];
        NSString *exportPath = [NSString stringWithFormat:@"%@/%@.mp4",
                                [NSHomeDirectory() stringByAppendingString:@"/tmp"],
                                [NSString stringDateNowTime]];
        exportSession.outputURL = [NSURL fileURLWithPath:exportPath];
//        NSLog(@"111111111111：%@", exportPath);
        exportSession.outputFileType = AVFileTypeMPEG4;
        [exportSession exportAsynchronouslyWithCompletionHandler:^{
            
            switch ([exportSession status]) {
                case AVAssetExportSessionStatusFailed:
                    NSLog(@"Export failed: %@", [[exportSession error] localizedDescription]);
                    break;
                case AVAssetExportSessionStatusCancelled:
                    NSLog(@"Export canceled");
                    break;
                case AVAssetExportSessionStatusCompleted:
                    NSLog(@"转换成功");
                    break;
                default:
                    break;
            }
//            NSLog(@"2222222222222：%@", exportPath);
        }];
        return exportPath;
    }else{
        return @"AVURLAsset+SetMp4位置错误";
    }
}
@end
