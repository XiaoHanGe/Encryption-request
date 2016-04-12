//
//  ViewController.m
//  Request
//
//  Created by JunQiang Han on 16/3/31.
//  Copyright © 2016年 JunQiang Han. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "SecurityUtil.h"
#import "GTMBase64.h"
#import "NSData+AES.h"
#define APP_PUBLIC_PASSWORD     @"cbgvIF2dkLfTgmRW"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)RequestBtn:(id)sender {
    NSString * url = @"http://app.czhhw.cn/api/schoolList";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [manager POST:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responseObject = %@", responseObject);
      

       NSData *dataSource = [GTMBase64 decodeData:responseObject];
       NSString * string = [SecurityUtil decryptAESData:dataSource];
    
        
        NSLog(@"%@",string);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error.description);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
