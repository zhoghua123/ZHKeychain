//
//  ViewController.m
//  ZHKeyChainDemo
//
//  Created by xyj on 2018/2/26.
//  Copyright © 2018年 xyj. All rights reserved.
//

#import "ViewController.h"
#import "ZHKeyChainManager.h"
@interface ViewController ()

@end

//测试
static NSString * const Keychain = @"zhonghua";

//自动登录,自存储自己的用户名和密码
NSString * const KEY_USERNAME_PASSWORD = @"com.company.app.usernamepassword";
NSString * const KEY_USERNAME = @"com.company.app.username";
NSString * const KEY_PASSWORD = @"com.company.app.password";

//所有登录该app的账号/密码列表
NSString * const KEY_USERNAME_PASSWORDLIST = @"com.company.app.usernamepasswordlist";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 存储数据
    BOOL save = [ZHKeyChainManager keyChainSaveData:@"思念诉说，眼神多像云朵" withIdentifier:Keychain];
    if (save) {
        NSLog(@"存储成功");
    }else {
        NSLog(@"存储失败");
    }
    // 获取数据
    NSString * readString = [ZHKeyChainManager keyChainReadData:Keychain];
    NSLog(@"获取得到的数据:%@",readString);
    
    // 更新数据
    BOOL updata = [ZHKeyChainManager keyChainUpdata:@"长发落寞，我期待的女孩" withIdentifier:Keychain];
    if (updata) {
        NSLog(@"更新成功");
    }else{
        NSLog(@"更新失败");
    }
    // 读取数据
    NSString * readUpdataString = [ZHKeyChainManager keyChainReadData:Keychain];
    NSLog(@"获取更新后得到的数据:%@",readUpdataString);
    
    // 删除数据
    [ZHKeyChainManager keyChainDelete:Keychain];
    // 读取数据
    NSString * readDeleteString = [ZHKeyChainManager keyChainReadData:Keychain];
    NSLog(@"获取删除后得到的数据:%@",readDeleteString);
}

/*******牛逼的分割线*********/
//单个存储:用于记住密码时,时自动登录
- (void)test {
    
    NSMutableDictionary *userNamePasswordKVPairs = [NSMutableDictionary dictionary];
    [userNamePasswordKVPairs setObject:@"zhonghua" forKey:KEY_USERNAME];
    [userNamePasswordKVPairs setObject:@"123456" forKey:KEY_PASSWORD];
    NSLog(@"%@", userNamePasswordKVPairs); //有KV值
    
    // A、将用户名和密码写入keychain
    [ZHKeyChainManager keyChainSaveData:userNamePasswordKVPairs withIdentifier:KEY_USERNAME_PASSWORD];
    
    // B、从keychain中读取用户名和密码
    NSMutableDictionary *readUsernamePassword = (NSMutableDictionary *)[ZHKeyChainManager keyChainReadData:KEY_USERNAME_PASSWORD];
    NSString *userName = [readUsernamePassword objectForKey:KEY_USERNAME];
    NSString *password = [readUsernamePassword objectForKey:KEY_PASSWORD];
    NSLog(@"username = %@", userName);
    NSLog(@"password = %@", password);
    
     //C、将用户名和密码从keychain中删除
    [ZHKeyChainManager keyChainDelete:KEY_USERNAME_PASSWORD];
}



/*******牛逼的分割线*********/
//用于:缓存登录账号的列表
- (void)test2WithAccount:(NSString *)account AndPassword:(NSString *)pwd {
    //1. 从钥匙串中拿到数据
    NSMutableArray *usernameAndPasswords = (NSMutableArray *)[ZHKeyChainManager keyChainReadData:KEY_USERNAME_PASSWORDLIST];
    if (!usernameAndPasswords) {
        usernameAndPasswords = [NSMutableArray array];
    }
    //2.将该账号和密码存入数组
    [usernameAndPasswords addObject:@{
        account ? account : @"" : pwd ? pwd: @""
    }];
    //3. 将用户名和密码写入keychain
    [ZHKeyChainManager keyChainSaveData:usernameAndPasswords withIdentifier:KEY_USERNAME_PASSWORDLIST];
}

- (IBAction)inputDatas:(id)sender {
    [self test2WithAccount:@"zhonghua" AndPassword:@"123456"];
    [self test2WithAccount:@"limeng" AndPassword:@"111111"];
    
}
//4.从keychain中读取用户名和密码
- (IBAction)readaction:(id)sender {
    NSMutableArray *readUsernamePassword = (NSMutableArray *)[ZHKeyChainManager keyChainReadData:KEY_USERNAME_PASSWORDLIST];
    if (!readUsernamePassword) {
        NSLog(@"没有存储到值呗");
    }
    NSLog(@"存入的账号密码列表%@",readUsernamePassword);
}

- (IBAction)clearnData:(id)sender {
    //5. 将用户名和密码从keychain中删除
    [ZHKeyChainManager keyChainDelete:KEY_USERNAME_PASSWORDLIST];
}

@end
