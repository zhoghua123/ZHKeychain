//
//  ZHMD5Tool.h
//  ZHKeyChainDemo
//
//  Created by xyj on 2018/2/27.
//  Copyright © 2018年 xyj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHMD5Tool : NSObject
//简单的MD5加密
+ ( NSString *)md5String:( NSString *)str;
//复杂的MD5加密
+ ( NSString *)md5String2:( NSString *)str;
@end
