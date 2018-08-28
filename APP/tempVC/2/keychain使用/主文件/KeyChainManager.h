//
//  KeyChainManager.h
//  VPNApp
//
//  Created by eillyer on 2018/7/27.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyChainManager : NSObject

/*!
 保存数据
 
 @data  要存储的数据
 @identifier 存储数据的标示
 */
+(BOOL) keyChainSaveData:(id)data withIdentifier:(NSString*)identifier ;

/*!
 读取数据
 
 @identifier 存储数据的标示
 */
+(id) keyChainReadData:(NSString*)identifier ;


/*!
 更新数据
 
 @data  要更新的数据
 @identifier 数据存储时的标示
 */
+(BOOL)keyChainUpdata:(id)data withIdentifier:(NSString*)identifier ;

/*!
 删除数据
 
 @identifier 数据存储时的标示
 */
+(void) keyChainDelete:(NSString*)identifier ;


/**
 查出data形式的秘钥

 @param identifier 描述
 @return data
 */
+ (NSData *)searchKeychainCopyMatching:(NSString *)identifier;
@end
