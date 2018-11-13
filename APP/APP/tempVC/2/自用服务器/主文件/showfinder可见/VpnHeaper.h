//
//  VpnHeaper.h
//  vpntest
//
//  Created by eillyer on 2018/8/8.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <NetworkExtension/NetworkExtension.h>
@interface VpnHeaper : NSObject

//创建单例
+ (VpnHeaper *)sharedVpnHeaper;
- (void)EstablishVPN;
- (void)ConnectVPN;

@end
