//
//  VpnHeaper.m
//  vpntest
//
//  Created by eillyer on 2018/8/8.
//  Copyright © 2018年 eillyer. All rights reserved.
//


//https://www.jianshu.com/p/1dcc840ecdfb




#import "VpnHeaper.h"

static NSString * const serviceName = @"144.202.80.252";

//static NSString * const vpnPwdIdentifier = @"efbuser1";//keychain的密码存取key
//static NSString * const vpnPrivateKeyIdentifier = @"";//keychain的共享秘钥存取key


@interface VpnHeaper ()

@property (nonatomic, strong) NEVPNManager *manager;

@end
static VpnHeaper * helper= nil;
@implementation VpnHeaper



+ (VpnHeaper *)sharedVpnHeaper{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[VpnHeaper alloc] init];
    });
    return helper;
}
- (void)EstablishVPN{
    
    //创建管理者
    self.manager = [NEVPNManager sharedManager];
    [self.manager loadFromPreferencesWithCompletionHandler:^(NSError * _Nullable error) {
        NSError *errors = error;
        if (errors ) {
            NSLog(@"load是失败的：%@",errors.description);
        }else{
            NEVPNProtocolIPSec *p = [[NEVPNProtocolIPSec alloc] init];
            //用户名
            p.username = @"efbuser1";
            //服务器地址
            p.serverAddress = @"144.202.80.252";
            p.authenticationMethod = NEVPNIKEAuthenticationMethodSharedSecret;//共享秘钥方式
            
            //密码vpn_password
            [self createKeychainValue:p.username forIdentifier:p.username];
            
            p.passwordReference = [self searchKeychainCopyMatching:p.username];
            
            //共享秘钥
            [self createKeychainValue:@"" forIdentifier:@""];
            p.sharedSecretReference = [self searchKeychainCopyMatching:@""];
            
            //讨论用于认证目的的本地IPSec端点的字符串。本地ID和远程ID；
            p.localIdentifier = @"";
            p.useExtendedAuthentication = YES;
            p.disconnectOnSleep = NO;
            
            
            //讨论在需求上切换vpn
            self.manager.onDemandEnabled = YES;
            
            //讨论一个包含特定于协议的vpn配置部分的nevpnprotocol;
            [self.manager setProtocolConfiguration:p];
            
            //我们app的描述
            self.manager.localizedDescription = @"EFBMuefb";
            
            //discussion切换vpn的启动状态，设置此属性将禁用其他应用程序的vpn配置，在启动其他vpn配置时，该属性将被设置为no；
            self.manager.enabled = true;
            
            //方法
            //@discussion这个函数在调用者的vpn首选项中保存了vpn设置。如果启用了vpn，就启用了vpn，并且在需求规则上有vpn。那么需求规则上的vpn就会被激活。
            //@param completionhandler，当保存操作完成时，将在主线程程上调用一个块，如果保存操作成功，则传递给该块的error将为nil，否则将为非nil。
            [self.manager saveToPreferencesWithCompletionHandler:^(NSError * _Nullable error) {
                if (error) {
                    NSLog(@"保存失败%@",error);
                }else{
                    NSLog(@"====保存成功");
                }
            }];
        }
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onVpnStateChange:) name:NEVPNStatusDidChangeNotification object:nil];
    
}

- (void)ConnectVPN{
  
    [self.manager loadFromPreferencesWithCompletionHandler:^(NSError * _Nullable error) {
        NSError *startError = nil;
        [self.manager.connection startVPNTunnelAndReturnError:&startError];//启动vpn通道
        if (startError) {
            NSLog(@"start 失败 ： %@",startError.localizedDescription);
        }else{
            NSLog(@"启动vpn隧道成功");
        }
    }];
}


- (void)onVpnStateChange:(NSNotification *)Notification{
    NEVPNStatus state = self.manager.connection.status;
    switch (state) {
        case NEVPNStatusInvalid:
            NSLog(@"无效链接");
            break;
        case NEVPNStatusDisconnected:
            NSLog(@"未连接");
            break;
        case NEVPNStatusConnecting:
            NSLog(@"正在链接");
            break;
        case NEVPNStatusConnected:
            NSLog(@"已链接");
            break;
        case NEVPNStatusDisconnecting:
            NSLog(@"断开链接");
            break;
        default:
            break;
    }
    
}

- (NSData *)searchKeychainCopyMatching:(NSString *)identifier{
    NSMutableDictionary *searchDictionary = [self newSearchDictionary:identifier];
    [searchDictionary setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
    [searchDictionary setObject:@YES forKey:(__bridge id)kSecReturnPersistentRef];
    CFTypeRef result = NULL;
    SecItemCopyMatching((__bridge CFDictionaryRef)searchDictionary, &result);
    return (__bridge NSData *)result;

}

- (BOOL)createKeychainValue:(NSString *)password forIdentifier:(NSString *)identifier{
    
    NSMutableDictionary *dictionary = [self newSearchDictionary:identifier];
    //OSStatus 就是一个返回状态的code，不同的类返回的结果不同
    OSStatus status = SecItemDelete((__bridge CFDictionaryRef)dictionary);
    NSData *passwordData = [password dataUsingEncoding:NSUTF8StringEncoding];
    [dictionary setObject:passwordData forKey:(__bridge id)kSecValueData];
    status = SecItemAdd((__bridge CFDictionaryRef)dictionary, NULL);
    if (status == errSecSuccess) {
        return YES;
    }
    return NO;
}
//服务器地址
//static NSString *const serviceName = @""
//传一个唯一标识符可以返回一个字典也就是参数
- (NSMutableDictionary *)newSearchDictionary:(NSString *)identifier{
    //keyChain item create 密钥链项创造
    NSMutableDictionary *searchDictionary = [[NSMutableDictionary alloc] init];
    //extern CFTypeRef kSecclassGenericPassword 一般密码
    //extern CFTypeRef kSecclassInternetPassword 网络密码
    //extern CFTypeRef kSecclassCertificate      证书
    //extern CFTypeRef kSecclassKey              秘钥
    //extern CFTypeRef kSecclassIdentity         带秘钥的证书 111
    [searchDictionary setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
    NSData *encodedIdentifier = [identifier dataUsingEncoding:NSUTF8StringEncoding];
    [searchDictionary setObject:encodedIdentifier forKey:(__bridge id)kSecAttrGeneric];
    //ksecclass 主键
    [searchDictionary setObject:encodedIdentifier forKey:(__bridge id)kSecAttrAccount];
    [searchDictionary setObject:serviceName forKey:(__bridge id)kSecAttrService];
    
    return searchDictionary;
}


@end
