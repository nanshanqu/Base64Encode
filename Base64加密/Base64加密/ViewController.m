//
//  ViewController.m
//  Base64加密
//
//  Created by Mac on 2020/4/18.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "ViewController.h"
#import "ASBase64Manager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
 base64编码是现代密码学的基础

 Base64加密：Base64加密因其算法和充当秘钥的索引表都是公开的，所以不属于加密算法。其本质是将"二进制"数据转换成字符串，方便使用HTTP协议，用于公开的代码加密、URL加密，防止数据明文传输

 特点：编码完成后的结果，只有64个字符

 */

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self base64PathSaveDic];
}

- (void)base64PathSaveDic {
    
    UIImage *image = [UIImage imageWithData:[ASBase64Manager initBase64PathSaveDicWithIconName:@"adsfkdv" ofType:@"jpg"]];
    UIImageView* imageView = [[UIImageView alloc] init];
    [self.view addSubview:imageView];
    imageView.frame = CGRectMake(100, 100, 50, 50);
    imageView.image = image;
}

 /// Base64加密
- (IBAction)base64Encode:(id)sender {
    
    NSString *string = [ASBase64Manager base64Encode:@"zhangsan"];
    NSLog(@"string:%@", string);
}

 /// Base64解密
- (IBAction)base64Decode:(id)sender {
    
    NSString *string = [ASBase64Manager base64Encode:@"zhangsan"];
    NSLog(@"string:%@", string);
    
    NSString *result = [ASBase64Manager base64Decode:string];
    NSLog(@"result:%@", result);
}

/// Base64加密对字符串进行加密和解密
- (IBAction)base64EncodeAndDecode:(id)sender {
    
    NSString *string = [ASBase64Manager base64Encode:@"zhangsan"];
    NSLog(@"string:%@", string);
}

/// 利用base64加密图片成NSData数据，并保存到沙盒路径，最后返回解密之后的Data数据
- (IBAction)base64ShaHe:(id)sender {
    
    UIImage *image = [UIImage imageWithData:[ASBase64Manager initBase64PathSaveDicWithIconName:@"adsfkdv" ofType:@"jpg"]];
    UIImageView* imageView = [[UIImageView alloc] init];
    [self.view addSubview:imageView];
    imageView.frame = CGRectMake(100, 100, 50, 50);
    imageView.image = image;
}

/// Base64加密对图片进行加密
- (IBAction)base64ForIcon:(id)sender {
    
    NSData *imgData = [ASBase64Manager base64WithIconName:@"adsfkdv.jpg"];
    UIImage *image = [UIImage imageWithData:imgData];
    UIImageView* imageView = [[UIImageView alloc] init];
    [self.view addSubview:imageView];
    imageView.frame = CGRectMake(200, 300, 50, 50);
    imageView.image = image;
}


/*
 
 /// Base64加密
 + (NSString *)base64Encode:(NSString* )string;

 /// Base64解密
 + (NSString *)base64Decode:(NSString *)string;

 /// Base64加密对字符串进行加密和解密
 - (void)base64WithString:(NSString *)string;

 /// 利用base64加密图片成NSData数据，并保存到沙盒路径，最后返回解密之后的Data数据
 /// @param iconName  图片icon
 /// @param ofType 后缀
 + (NSData *)initBase64PathSaveDicWithIconName:(NSString *)iconName ofType:(NSString *)ofType;

 /// Base64加密对图片进行加密
 - (NSData *)base64WithIconName:(NSString *)iconName;
 
 */


@end
