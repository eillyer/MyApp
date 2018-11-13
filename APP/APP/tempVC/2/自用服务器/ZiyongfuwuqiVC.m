//
//  ZiyongfuwuqiVC.m
//  APP
//
//  Created by eillyer on 2018/8/4.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "ZiyongfuwuqiVC.h"

//#import "SSProxyProtocol.h"
//#import "ShadowsocksClient.h"

//static ShadowsocksClient *proxy;


@interface ZiyongfuwuqiVC ()

@end

@implementation ZiyongfuwuqiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //登录
    //    [BmobUser loginWithUsernameInBackground:@"share44" password:@"share44" block:^(BmobUser *user, NSError *error) {
    //        NSLog(@"%@",user);
    //
    //        if (error) {
    //            exit(1);
    //            GGLog(@"%@",error.description);
    //        }else{
    //            GGLog(@"%@",user);
    //        }
    //    }];
    
    
    //    注册用户
    //    http://doc.bmob.cn/data/ios/develop_doc/#_77
    //        BmobUser *user = [[BmobUser alloc] init];
    //        user.password = [NSString stringWithFormat:@"share%d",i];
    //        user.username = [NSString stringWithFormat:@"share%d",i];
    //        [user signUpInBackground];
    
    //添加数据
    //往GameScore表添加一条playerName为小明，分数为78的数据
    //    BmobObject *gameScore = [BmobObject objectWithClassName:@"test"];
    //    [gameScore setObject:@"小明asdf" forKey:@"playerName"];
    //    [gameScore setObject:@78 forKey:@"score"];
    //    [gameScore setObject:[NSNumber numberWithBool:YES] forKey:@"cheatMode"];
    //    [gameScore saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
    //        //进行操作
    //        NSLog(@"%@",isSuccessful?@"yes":@"no");
    //    }];
    
    
    //上传文件
    
    
    //            NSString *fileString = [[NSBundle mainBundle] pathForResource:@"123456" ofType:@"ipa"];
    //
    //            BmobObject *obj = [BmobObject objectWithClassName:@"VPN"];
    //        //    BmobFile *file1 = [[BmobFile alloc] initWithClassName:@"Asc" withFilePath:fileString];
    //            BmobFile *file1 = [[BmobFile alloc] initWithFilePath:fileString];
    //            [file1 saveInBackground:^(BOOL isSuccessful, NSError *error) {
    //                if (isSuccessful) {
    //                    [obj setObject:file1  forKey:@"Data"];
    //                    [obj setObject:file1.url  forKey:@"url"];
    //                    [obj saveInBackground];
    //                    NSLog(@"file1 url %@",file1.url);
    //                }else{
    //                    NSLog(@"失败");
    //                }
    //            } withProgressBlock:^(CGFloat progress) {
    //                NSLog(@"上传进度%.2f",progress);
    //            }];
    
    
    //        NSData *data = UIImagePNGRepresentation([UIImage imageNamed:@"1.png"]);
    //        BmobFile *file = [[BmobFile alloc]initWithFileName:@"512.png" withFileData:data];
    //        BmobObject *obj = [BmobObject objectWithClassName:@"VPN"];
    //        [file saveInBackground:^(BOOL isSuccessful, NSError *error) {
    //            //如果文件保存成功，则把文件添加到filetype列
    //            if (isSuccessful) {
    //                //上传文件的URL地址
    //                [obj setObject:file.url  forKey:@"url"];
    //                //此处相当于新建一条记录,         //关联至已有的记录请使用 [obj updateInBackground];
    //                [obj saveInBackground];
    //                NSLog(@"成功");
    //            }else{
    //                //进行处理
    //                NSLog(@"失败%@",error.description);
    //
    //            }
    //        }];
    
    //    NSString *fileString = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"png"];
    //
    //    BmobObject *obj = [BmobObject objectWithClassName:@"VPN"];
    ////    BmobFile *file1 = [[BmobFile alloc] initWithClassName:@"Asc" withFilePath:fileString];
    //    BmobFile *file1 = [[BmobFile alloc] initWithFilePath:fileString];
    //    [file1 saveInBackground:^(BOOL isSuccessful, NSError *error) {
    //        if (isSuccessful) {
    //            [obj setObject:file1  forKey:@"Data"];
    //            [obj setObject:file1.url  forKey:@"url"];
    //            [obj saveInBackground];
    //            NSLog(@"file1 url %@",file1.url);
    //        }else{
    //            NSLog(@"失败");
    //        }
    //    } withProgressBlock:^(CGFloat progress) {
    //        NSLog(@"上传进度%.2f",progress);
    //    }];
    
    
    
    
    
}

//VPN 服务
/*  https://www.jianshu.com/p/fcd49e210d34  参考
 1,下载https://www.dropbox.com/s/6f1rxfjkk0ha89n/NEProviderTargetTemplates.pkg?dl=0 模板撞到xcode
 
 2，file->new->target->Package Tunnrl Provider 创建文件名为：Extension 语言为swift
 
 3，开启vpn和NeworkExtension权限
 
 4.#import <NetworkExtension/NetworkExtension.h>

 
 5.https://juejin.im/entry/5833f6330ce463006cf32ea3 配置plist文件
 
 6.
 
 
 
 
 
 */
- (void)setVPN{
    
    //两种方式
//    [self setvpn];
//    [self setvpn2];
    
}


- (void)setOKVPN{
    /*
     
     查看321文件的参数来配置
     
     需要主文件，导入
     #import "SSProxyProtocol.h"
     #import "ShadowsocksClient.h"
     
     static ShadowsocksClient *proxy;
     

     
     ⚠️我觉得要看懂，需要掌握的知识有：unix socket编程、加密技术、tcp/ip详解
     1、流量代理在这个例子里面的思路是将所有流量导入到规定的端口发出去；
     2、再监听这个给定的端口，监听之后经过这个端口的流量可以拿到；
     3、一开始向给定的端口发送自己构造的数据，告诉应该该端口发送的数据应该以什么协议版本和方法发送；
     4、紧接着，app的请求发出，请求数据被拦截，加密，然后连接代理服务器的socket，在连接成功之后会将之前拦截并加密的数据发出去；
     5、因为这个地方将本地发送的数据拦截了，所以需要自己构造一个数据，形成一个fake reply回复一下客户端（至于为什么要回复，请参考sock5的RFC 说得挺清楚的）。
     6、接下来就是等待代理服务器那边的回复了，回复过来的数据解密然后发给10800端口。
    
    
    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
        
        //实例化一个shadowsocks client类，并赋予类的一些属性
        proxy = [[ShadowsocksClient alloc] initWithHost:@""
                                                   port:443
                                               password:@"ByzSbH880f"
                                                 method:@"aes-256-cfb"];
        //proxy类是NSURLProtocol的子类，,处理socket的accept和bind()等事件及其回调
        //proxy可以将流量导到代理服务器上去
        [proxy startWithLocalPort:10800];
        //ssproxyProtocal是NSURLProtocol的子类，里面规定了所有请求应该走的端口，并在这个类里面调用代理的回调通知上一级
        [SSProxyProtocol setLocalPort:10800];
        [NSURLProtocol registerClass:[SSProxyProtocol class]];
        
        //一旦有请求，会先走SSProxyProtocol，SSProxyProtocol会将流量导向自己规定的10800端口，在10800端口上会有一个socket代理，会将流量加密然后发出去。
        
        // Override point for customization after application launch.
        return YES;
    }
     
     */
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


- (void)setvpn2{
    
    /*
    NEVPNManager *manager = [NEVPNManager sharedManager];
    
    [manager loadFromPreferencesWithCompletionHandler:^(NSError *error) {
        
        if(error) {
            
            NSLog(@"Load error: %@", error);
            
        } else {
            NEVPNProtocolIPSec *p = [[NEVPNProtocolIPSec alloc] init];
            
            p.username = @"[Your username]";
            
            p.passwordReference = [KeyChainManager searchKeychainCopyMatching: @"aaa"];
            
            p.serverAddress = @"[Your server address]";
            
            p.authenticationMethod = NEVPNIKEAuthenticationMethodSharedSecret;
            
            p.sharedSecretReference = [KeyChainManager searchKeychainCopyMatching: @"aaa"];
            
            p.localIdentifier = @"[VPN local identifier]";
            
            p.remoteIdentifier = @"[VPN remote identifier]";
            
            p.useExtendedAuthentication = YES;
            
            p.disconnectOnSleep = NO;
            
            [manager setProtocol:p];
            
            [manager setOnDemandEnabled:NO];
            
            [manager setLocalizedDescription:@"[You VPN configuration name]"];
            
            [manager saveToPreferencesWithCompletionHandler:^(NSError *error) {
                
                if(error) {
                    
                    NSLog(@"Save error: %@", error);
                    
                }
                
                else {
                    
                    NSLog(@"Saved!");
                    
                }
                
            }];
            
            
        }
        
    }];
    */
}

- (void)setvpn{
    /*
    NEVPNManager *manager = [NEVPNManager sharedManager];
    [manager loadFromPreferencesWithCompletionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"失败：%@",error);
        }else{
            NEVPNProtocolIKEv2 *ikev = [[NEVPNProtocolIKEv2 alloc] init];
            ikev.certificateType = NEVPNIKEv2CertificateTypeRSA;
            ikev.authenticationMethod = NEVPNIKEAuthenticationMethodCertificate;
            ikev.useExtendedAuthentication = YES;
            ikev.username = @"name";
            ikev.passwordReference = [KeyChainManager searchKeychainCopyMatching: @"aaa"];
            ikev.serverAddress = @"https://www.youtub.com";
            ikev.remoteIdentifier = @"123";
            ikev.identityReference = [KeyChainManager searchKeychainCopyMatching: @"aaa"];
            [manager setEnabled:YES];
            [manager setProtocol:ikev];
            [manager setOnDemandEnabled:NO];
            [manager setLocalizedDescription:@"MYVPN"];
            [manager saveToPreferencesWithCompletionHandler:^(NSError * _Nullable error) {
                if (error) {
                    NSLog(@"失败：%@",error);
                }else{
                    NSLog(@"saved");
                }
            }];
        }
    }];
     */
}


- (void)setvpn3{
    //    NETunnelProviderManager *manager = [NETunnelProviderManager new];
    //    NETunnelProviderProtocol *pro = [NETunnelProviderProtocol new];
    //    pro.serverAddress = @"my vpn";
    //    manager.protocolConfiguration = pro;
    //    manager.localizedDescription = @"my vpn";
    //    [manager setEnabled:YES];
    //
    //
    //    [NETunnelProviderManager loadAllFromPreferencesWithCompletionHandler:^(NSArray<NETunnelProviderManager *> * _Nullable managers, NSError * _Nullable error) {
    //
    //        if (error) {
    //
    //        }else{
    //            NETunnelProviderManager *mng;
    //
    //            if (managers.count) {
    //                mng = managers[0];
    //            }else{
    //                mng = [self creatMng];
    //            }
    //        }
    //
    //
    //    }];

}
//
//-(void)loadVpn
//{
//    [NETunnelProviderManager loadAllFromPreferencesWithCompletionHandler:^(NSArray<NETunnelProviderManager *> * _Nullable managers, NSError * _Nullable error) {
//        if (error == nil && [managers count] > 0) {
//            self.manager = [managers firstObject];
//            if ([managers count] > 1) {
//                for (NETunnelProviderManager* manager in managers) {
//                    [manager removeFromPreferencesWithCompletionHandler:^(NSError * _Nullable error) {
//                        if (error == nil) {
//                            NSLog(@"remove dumplicate VPN config successful!");
//                        }else{
//                            NSLog(@"remove dumplicate VPN config failed with %@", error);
//                        }
//                    }];
//                }
//            }
//        }
//        if (self.manager == nil) {
//            [self createVPN];
//            [self saveVPN];
//        }
//    }];
//}
//
//-(void)createVPN
//{
//    self.manager = [[NETunnelProviderManager alloc] init];
//    NETunnelProviderProtocol* config = [[NETunnelProviderProtocol alloc] init];
//    config.serverAddress = @"DeepSS";
//    NSString* rule = [self ruleConfig];
//    config.providerConfiguration = @{@"ss_address":@"*.*.*.*", @"ss_port":@17238,@"ss_method":@"CHACHA20",@"ss_password":@"******",@"ymal_conf":rule};
//    self.manager.protocolConfiguration = config;
//    self.manager.localizedDescription = @"WXQ";
//    self.manager.enabled = YES;
//}
//
//-(void)saveVPN
//{
//    [self.manager saveToPreferencesWithCompletionHandler:^(NSError * _Nullable error) {
//        if (error == nil) {
//            //注意这里保存配置成功后，一定要再次load，否则会导致后面StartVPN出异常
//            [self.manager loadFromPreferencesWithCompletionHandler:^(NSError * _Nullable error) {
//                if (error == nil) {
//                    NSLog(@"save vpn success");
//                }
//            }];
//        }
//    }];
//}


@end
