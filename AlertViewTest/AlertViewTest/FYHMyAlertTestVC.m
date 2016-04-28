//
//  FYHMyAlertTestVC.m
//  AlertViewTest
//
//  Created by cyberzone on 16/4/18.
//  Copyright © 2016年 FYH. All rights reserved.
//

#import "FYHMyAlertTestVC.h"
#import "MyAlertViewByRunTime.h"

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

@interface FYHMyAlertTestVC () <UIAlertViewDelegate>

@end

@implementation FYHMyAlertTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createUI];
}

- (void)createUI {
    for (int i = 1; i < 4; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20, 50 + 50 * i, SCREEN_WIDTH - 40, 44);
        btn.backgroundColor = [UIColor redColor];
        [btn setTitle:[NSString stringWithFormat:@"Btn -- %d", i] forState:UIControlStateNormal];
        btn.tag = 1000 + i;//tag
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}
#pragma mark - Btn 点击事件相关
- (void)btnClick:(UIButton *)btn {
    if (btn.tag == 1001) {
        //UIAlertView --- 自定义
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"UIAlertView"
                                                     message:@"自定义"
                                                    delegate:self
                                           cancelButtonTitle:@"Left"
                                           otherButtonTitles:@"Right", nil];
        av.callBack = ^(UIAlertView *alertView, NSUInteger buttonIndex) {
            if (buttonIndex == 1) {
                NSLog(@"UIAlertView --- 执行自定义 Delegate 方法");
            }
        };
        [av show];
    }
    
    if (btn.tag == 1002) {
        //UIAlertView --- 系统
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"UIAlertView"
                                                     message:@"系统"
                                                    delegate:self
                                           cancelButtonTitle:@"Left"
                                           otherButtonTitles:@"Right", nil];
        [av show];
    }
    
    if (btn.tag == 1003) {
        //UIAlertController
        UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:@"UIAlertController"
                                                                          message:@"系统 iOS8.0 后,可以使用这个"
                                                                   preferredStyle:UIAlertControllerStyleActionSheet];
        [alertCon addAction:[UIAlertAction actionWithTitle:@"Default" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //
        }]];
        [alertCon addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            //
        }]];
        [alertCon addAction:[UIAlertAction actionWithTitle:@"Destructive" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            //
        }]];
        [self presentViewController:alertCon animated:YES completion:^{
            //
            NSLog(@"UIAlertController --- 执行系统 Delegate 方法");
        }];
    }
}
#pragma mark - AlertDelegate 方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"UIAlertView -- 执行系统 Delegate 方法");
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
