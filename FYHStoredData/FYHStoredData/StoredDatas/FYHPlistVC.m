//
//  FYHPlistVC.m
//  FYHStoredData
//
//  Created by cyberzone on 16/4/25.
//  Copyright © 2016年 FYH. All rights reserved.
//

#import "FYHPlistVC.h"

@interface FYHPlistVC ()

@end

@implementation FYHPlistVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
   
    //属性列表 - plist
    [self createPilsts];
}

- (void)createPilsts {
    NSLog(@"*** *** plist 文件读写相关 *** ***");
    /*
     属性列表常用于存储用户设置,可以用于存储捆绑信息;扩展名为 .plist
     优点:可以直接在工程中查看编辑
     缺点:只能存储 Foundation 框架中的类型
    */
    
    //初始化
    //获取 plist 文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"PropertyList" ofType:@"plist"];
    //读取 plist 文件,实例化 Dic
    NSDictionary *pilstDic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSLog(@"plistDic 初始化 --- %@", pilstDic);
    
    //开始写入 plist 文件!
    //构建路径
    NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/myPlist.plist"];
    //填数据 setObj - forkey
    NSMutableDictionary *plistDic = [NSMutableDictionary dictionary];
    [plistDic setObject:@"数据" forKey:@"name"];
    [plistDic setObject:@"20" forKey:@"MB"];
    [plistDic setObject:@"100min" forKey:@"time"];
    //将文件写入至 plist
    [plistDic writeToFile:path atomically:YES];
    NSLog(@"plistDic 写入后 --- %@", plistDic);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
