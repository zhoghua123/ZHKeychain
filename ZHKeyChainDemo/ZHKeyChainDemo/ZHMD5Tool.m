//
//  ZHMD5Tool.m
//  ZHKeyChainDemo
//
//  Created by xyj on 2018/2/27.
//  Copyright © 2018年 xyj. All rights reserved.
//

#import "ZHMD5Tool.h"
#import <CommonCrypto/CommonDigest.h>
@implementation ZHMD5Tool
//简单的MD5加密
+ ( NSString *)md5String:( NSString *)str

{
    
    const char *myPasswd = [str UTF8String ];
    
    unsigned char mdc[ 16 ];
    
    CC_MD5 (myPasswd, ( CC_LONG ) strlen (myPasswd), mdc);
    
    NSMutableString *md5String = [ NSMutableString string ];
    
    for ( int i = 0 ; i< 16 ; i++) {
        
        [md5String appendFormat : @"%02x" ,mdc[i]];
        
    }
    
    return md5String;
    
}
+ ( NSString *)md5String2:( NSString *)str

{
    
    const char *myPasswd = [str UTF8String ];
    
    unsigned char mdc[ 16 ];
    
    CC_MD5 (myPasswd, ( CC_LONG ) strlen (myPasswd), mdc);
    
    NSMutableString *md5String = [ NSMutableString string ];
    
    [md5String appendFormat : @"%02x" ,mdc[ 0 ]];
    
    for ( int i = 1 ; i< 16 ; i++) {
        
        [md5String appendFormat : @"%02x" ,mdc[i]^mdc[ 0 ]];
    }
    
    return md5String;
}
 
@end
