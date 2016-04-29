//
//  FYHPreferenceSetVC.m
//  FYHStoredData
//
//  Created by cyberzone on 16/4/25.
//  Copyright © 2016年 FYH. All rights reserved.
//

#import "FYHPreferenceSetVC.h"

@interface FYHPreferenceSetVC ()

@end

@implementation FYHPreferenceSetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    /*
        NSUserDefaults 单例,线程安全;偏好设置专门用来保存应用程序的配置信息
        如利用偏好设置来存储数据,默认就是存储在 perfences 文件夹下,会将所有数据都保存到同一文件
        优点:使用简单
        缺点:只支持 NSString,NSArray,NSNumber,NSData,NSDictionary
     */

    [self createPreferenceSet];
}

- (void)createPreferenceSet {
    //保存偏好设置
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"fyh"];
    //数据同步
    [[NSUserDefaults standardUserDefaults] synchronize];
    //获取偏好设置
    BOOL is = [[NSUserDefaults standardUserDefaults] boolForKey:@"fyh"];
    [[NSUserDefaults standardUserDefaults] setObject:@"数据" forKey:@"name"];
    NSLog(@"%d", is);
    
    //查看偏好设置存储文件路径
    NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Library/Preferences"];
    NSLog(@"文件存储路径:%@", path);
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
