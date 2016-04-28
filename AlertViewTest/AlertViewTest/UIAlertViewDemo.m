//
//  UIAlertViewDemo.m
//  AlertViewTest
//
//  Created by cyberzone on 16/4/18.
//  Copyright © 2016年 FYH. All rights reserved.
//

#import "UIAlertViewDemo.h"

@interface UIAlertViewDemo () <UIAlertViewDelegate> {
    UIAlertView *alertView;
}

@end

@implementation UIAlertViewDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                    message:@"确定退出?"
                                    delegate:self
                                    cancelButtonTitle:@"确定"
                                    otherButtonTitles:@"取消", @"返回", nil];
    [alertView show];//展示
}
#pragma mark - AlertView 代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"BtnIndex --- %d", buttonIndex);
    if (buttonIndex == 0) {
        //
        NSLog(@"确定");
        [self dismissViewControllerAnimated:YES completion:^{
            //
        }];
    } else if (buttonIndex == 1) {
        //
        NSLog(@"取消");
        [self dismissViewControllerAnimated:YES completion:^{
            //
        }];
    } else {
        //
        NSLog(@"返回");
        [self dismissViewControllerAnimated:YES completion:^{
            //
        }];
    }
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
