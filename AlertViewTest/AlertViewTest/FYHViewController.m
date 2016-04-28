//
//  FYHViewController.m
//  AlertViewTest
//
//  Created by cyberzone on 16/4/18.
//  Copyright © 2016年 FYH. All rights reserved.
//

#import "FYHViewController.h"
#import "UIAlertControllerDemo.h"
#import "UIAlertViewDemo.h"

#import "FYHMyAlertTestVC.h"

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

@interface FYHViewController ()

@end

@implementation FYHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    NSArray *titleArr = @[@"AlertController", @"AlertView", @"MyAlert"];
    
    for (int i = 0; i < 3; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20, 50 + 50 * i, SCREEN_WIDTH - 40, 44);
        btn.backgroundColor = [UIColor blackColor];
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.tag = 100 + i;//tag
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}
#pragma mark - Btn 点击事件
- (void)btnClick:(UIButton *)btn {
    switch (btn.tag) {
        case 100:
            //UIAlertController
            [self presentViewController:[[UIAlertControllerDemo alloc] init] animated:YES completion:^{
                
                NSLog(@"UIAlertController");
            }];
            break;
        case 101:
            //UIAlertView
            [self presentViewController:[[UIAlertViewDemo alloc] init] animated:YES completion:^{
                
                NSLog(@"UIAlertView");
            }];
            break;
        case 102:
            //MyAlert
            [self presentViewController:[[FYHMyAlertTestVC alloc] init] animated:YES completion:^{
                
                NSLog(@"FYHMyAlertTestVC");
            }];
            break;
            
        default:
            break;
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
