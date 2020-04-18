//
//  ASBase64Manager.m
//  Base64加密
//
//  Created by Mac on 2020/4/18.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "ASBase64Manager.h"
#import <UIKit/UIKit.h>

@implementation ASBase64Manager

/// Base64加密
+ (NSString *)base64Encode:(NSString* )string {
    
    // 转化为二进制数据
    NSData* data = [string dataUsingEncoding: NSUTF8StringEncoding];
    
    // 进行Base64加密
    return [data base64EncodedStringWithOptions:0];
    
}

/// Base64解密
+ (NSString *)base64Decode:(NSString *)string {
    
    NSData* data = [[NSData alloc] initWithBase64EncodedString:string options:0];
    
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
}

/// Base64加密对字符串进行加密
+ (void)base64WithString:(NSString *)string {
    
    // 字符串转成Data
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    // 加密Data
    NSData *encodeData = [data base64EncodedDataWithOptions:0]; // 20 bytes
    NSString *encodeStr = [[NSString alloc] initWithData:encodeData encoding:NSUTF8StringEncoding];
    NSLog(@"加密encodeStr:%@", encodeStr);
    
    // 解密Data
    NSData *decodeData = [[NSData alloc] initWithBase64EncodedData:encodeData options:0]; // 13 bytes
    
    // Data转字符串
    NSString *decodeStr = [[NSString alloc] initWithData:decodeData encoding:NSUTF8StringEncoding];
    NSLog(@"解密decodeStr:%@",decodeStr);// encode string
}

/// 利用base64加密图片成NSData数据，并保存到沙盒路径，最后返回解密之后的Data数据
/// @param iconName  图片icon
/// @param ofType 后缀
+ (NSData *)initBase64PathSaveDicWithIconName:(NSString *)iconName ofType:(NSString *)ofType {
    
    // 1.将文件进行加密
    NSString* path = [[NSBundle mainBundle] pathForResource:iconName ofType:ofType];
    
    // 获取需要加密的文件的二进制数据
    NSData* data = [NSData dataWithContentsOfFile:path];
    
    // base64EncodedStringWithOptions--加密
    NSData* base64Data = [data base64EncodedDataWithOptions:0];
    //获取要存储的沙河目录的路径
    NSArray* pathsArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* docDir = [pathsArr objectAtIndex:0];
    NSString* pathSave = [docDir stringByAppendingPathComponent:@"base64Test.txt"];
    
    //存储加密后的文件
    [base64Data writeToFile:pathSave atomically:YES];
    //获得加密后的二进制数据
    NSData* baseSave64Data = [NSData dataWithContentsOfFile:pathSave];
    
    //解密
    NSData* baseData = [[NSData alloc] initWithBase64EncodedData:baseSave64Data options:0];
    
    return baseData;
    
}

/// Base64加密对图片进行加密
+ (NSData *)base64WithIconName:(NSString *)iconName {
    
    // 加密解密是只有NSData才能进行，所以要先把需要加密的数据转化为NSData类型
    UIImage *img = [UIImage imageNamed:iconName];
    // 图片转Data
    NSData *data = UIImageJPEGRepresentation(img, 0.7);
    
    
//    // 字符串转Data
//    NSString *str = @"encode string";
//    // 字符串转成Data
//    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding]; // 13 bytes
    
    // 加密Data
    NSData *encodeData = [data base64EncodedDataWithOptions:0];// 20 bytes
    
    // 解密Data
    NSData *decodeData = [[NSData alloc] initWithBase64EncodedData:encodeData options:0]; // 13 bytes
    // Data转字符串
//    NSString *decodeStr = [[NSString alloc] initWithData:decodeData encoding:NSUTF8StringEncoding];
//    NSLog(@"%@",decodeStr);// encode string
    
    return decodeData;
}






@end
