//
//  ViewController.m
//  test2
//
//  Created by xyj on 2018/2/26.
//  Copyright © 2018年 xyj. All rights reserved.
//

#import "ViewController.h"
#import "ZHKeyChainManager.h"
@interface ViewController ()

@end
NSString * const KEY_USERNAME_PASSWORDLIST = @"com.company.app.usernamepasswordlist";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSMutableArray *readUsernamePassword = (NSMutableArray *)[ZHKeyChainManager keyChainReadData:KEY_USERNAME_PASSWORDLIST];
    if (!readUsernamePassword) {
        NSLog(@"没有存储到值呗");
    }
    NSLog(@"存入的账号密码列表%@",readUsernamePassword);
}

@end
