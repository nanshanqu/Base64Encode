//
//  ASBase64Manager.h
//  Base64加密
//
//  Created by Mac on 2020/4/18.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ASBase64Manager : NSObject

/// Base64加密
+ (NSString *)base64Encode:(NSString* )string;

/// Base64解密
+ (NSString *)base64Decode:(NSString *)string;

/// Base64加密对字符串进行加密和解密
+ (void)base64WithString:(NSString *)string;

/// 利用base64加密图片成NSData数据，并保存到沙盒路径，最后返回解密之后的Data数据
/// @param iconName  图片icon
/// @param ofType 后缀
+ (NSData *)initBase64PathSaveDicWithIconName:(NSString *)iconName ofType:(NSString *)ofType;

/// Base64加密对图片进行加密
+ (NSData *)base64WithIconName:(NSString *)iconName;

@end

NS_ASSUME_NONNULL_END
