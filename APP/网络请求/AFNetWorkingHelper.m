//
//  AFNetWorkingHelper.h
//
//  Created by liyonglong on 2016/8/7.
//  Copyright © 2016年 eillyer. All rights reserved.
//

#import "AFNetWorkingHelper.h"
#import "NSString+NowDate.h"

@interface AFNetWorkingHelper ()
@property (nonatomic,strong) AFHTTPSessionManager *sessionManager;// 管理请求
@property (nonatomic,strong) UIActivityIndicatorView *activity;//菊花
@property (nonatomic,strong) UIProgressView * progressView;//进度条
@property (nonatomic,strong) NSString *responseObj;// 返回数据
@end


@implementation AFNetWorkingHelper
// 单例
+ (instancetype)sharedAFNetworkingHelper {
    static AFNetWorkingHelper *networkingHelper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        networkingHelper = [AFNetWorkingHelper new];
    });
    return networkingHelper;
}


- (void)getMethodWithStringsOfURL:(NSString *)urlStr
                           selfVC:(UIViewController *)vc
                          success:(void(^)(NSDictionary *responseDict))successBlock
                            error:(void(^)(NSString *error))errorBlock {
    //小菊花
    if (vc) {
        [vc.view addSubview:self.activity];
        self.activity.hidden = NO;
    }
    // 设置返回请求数据类型一般的可以为JSON,XML与NSData类型
    //    AFHTTPResponseSerializer              NSData类型
    //    AFXMLParserResponseSerializer         XML类型
    //    AFJSONResponseSerializer              JSON类型
    self.sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [self.sessionManager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        // 相关下载操作
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功返回的数据
        if (responseObject) {
            //            NSLog(@"GET请求返回的数据为---------%@",responseObject);
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            if ([NSJSONSerialization isValidJSONObject:jsonDict]) {
                successBlock(jsonDict);
            }
        } else {
            errorBlock(@"GET请求成功,未有数据!");
        }
        self.activity.hidden = YES;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败返回的数据
        if (error) {
            errorBlock(error.description);
        }
        self.activity.hidden = YES;

    }];
}





- (void)postDataWithStringsOfURL:(NSString *)urlStr
                          selfVC:(UIViewController *)vc
                  isShowProgress:(BOOL)isShow
     imageDataArrOrMp4PathStrArr:(NSArray *)dataArr
                      parameters:(NSDictionary *)parameters
                            file:(NSString *)parameter
                         success:(void(^)(NSDictionary *responseDict))successBlock
                           error:(void(^)(NSString *error))errorBlock
                          number:(void(^)(double number))numberBlock{
    
    //小菊花
    if (vc) {
        [vc.view addSubview:self.activity];
        self.activity.hidden = NO;
        self.progressView.hidden = !isShow;
    }
    self.sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    if (dataArr.count) {
        //判断是图片还是视频
        if ([[dataArr[0] class] isSubclassOfClass:[NSString class]]) {
            //视频
            [self.sessionManager POST:urlStr parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                for (NSString *Mp4Path in dataArr) {
                    NSData *data = [NSData dataWithContentsOfFile:Mp4Path];
                    
                    NSString *fileName = [NSString stringWithFormat:@"%@ios.mp4",[NSString stringDateNowTime]];
                    [formData appendPartWithFileData:data
                                                name:parameter
                                            fileName:fileName
                                            mimeType:@"video/mpeg"];
                }
            } progress:^(NSProgress * _Nonnull uploadProgress) {
                // 上传相关
                double a = (double)uploadProgress.completedUnitCount*1.0/(double)uploadProgress.totalUnitCount;
                numberBlock(a);
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.progressView setProgress:a];
                });
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                // 请求成功返回的数据
                if (responseObject) {
                    //            NSLog(@"GET请求返回的数据为---------%@",responseObject);
                    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                    if ([NSJSONSerialization isValidJSONObject:jsonDict]) {
                        successBlock(jsonDict);
                    }
                } else {
                    errorBlock(@"GET请求成功,未有数据!");
                }
                self.activity.hidden = YES;
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (error) {
                    NSLog(@"mp4上传请求出现错误------%@",error.description);
                    errorBlock(error.description);
                }
                self.activity.hidden = YES;
            }];
        }else{
            //图片
            [self.sessionManager POST:urlStr parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                
                if (dataArr.count) {
                    for (int i = 0; i < dataArr.count; i++) {
                        
                        UIImage *image = [UIImage imageWithData:dataArr[i]];
                        NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
                        NSString *fileName = [NSString stringWithFormat:@"%@%d.jpg",[NSString stringDateNowTime],i];
                        [formData appendPartWithFileData:imageData
                                                    name:parameter
                                                fileName:fileName
                                                mimeType:@"image/jpg"];
                    }
                }
            } progress:^(NSProgress * _Nonnull uploadProgress) {
                // 上传相关
                double a = (double)uploadProgress.completedUnitCount*1.0/(double)uploadProgress.totalUnitCount;
                numberBlock(a);
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.progressView setProgress:a];
                });
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                // 请求成功返回的数据
                if (responseObject) {
                    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                    if ([NSJSONSerialization isValidJSONObject:jsonDict]) {
                        successBlock(jsonDict);
                    }
                } else {
                    errorBlock(@"GET请求成功,未有数据!");
                }
                self.activity.hidden = YES;
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (error) {
                    NSLog(@"图片上传请求出现错误------%@",error.description);
                    errorBlock(error.description);
                }
                self.activity.hidden = YES;
            }];
        }
    }else{
        //普通
        [self.sessionManager POST:urlStr parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        } progress:^(NSProgress * _Nonnull uploadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            // 请求成功返回的数据
            if (responseObject) {
                //                        NSLog(@"GET请求返回的数据为---------%@",responseObject);
                NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                if ([NSJSONSerialization isValidJSONObject:jsonDict]) {
                    successBlock(jsonDict);
                }
            } else {
                errorBlock(@"Post请求成功,未有数据!");
            }
            self.activity.hidden = YES;
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (error) {
                            NSLog(@"POST请求出现错误------%@",error.description);
                errorBlock(error.description);
            }
            self.activity.hidden = YES;
        }];
    }
}
#pragma mark -- 懒加载
- (UIActivityIndicatorView *)activity{
    if (!_activity) {
        _activity = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        [_activity startAnimating];
        _activity.color = [UIColor blackColor];
        _activity.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        _activity.hidden = YES;
    }
    return _activity;
}

- (UIProgressView *)progressView{
    if (!_progressView) {
        //        _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 10)];
        _progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        _progressView.frame = CGRectMake(0, 1, kScreenWidth, 10);
        //        _progressView.center = self.view.center;
        [_activity addSubview:_progressView];
        //        _progressView.progress = 0;
        _progressView.progressTintColor = kFWColorGreen;
        _progressView.trackTintColor = [UIColor whiteColor];
        _progressView.hidden = YES;
        [_progressView setProgress:0.0];
    }
    return _progressView;
}


- (AFHTTPSessionManager *)sessionManager {
    if (!_sessionManager) {
        _sessionManager = [AFHTTPSessionManager manager];
    }
    return _sessionManager;
}
@end
