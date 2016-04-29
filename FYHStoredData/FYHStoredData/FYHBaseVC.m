//
//  FYHBaseVC.m
//  FYHStoredData
//
//  Created by cyberzone on 16/4/25.
//  Copyright © 2016年 FYH. All rights reserved.
//

//属性列表:plist
//对象归档:NSCoding
//偏好设置: Preference
//数据库

#import "FYHBaseVC.h"
#import "FYHPlistVC.h"
#import "FYHAnalysisVC.h"
#import "FYHObjFileVC.h"
#import "FYHPreferenceSetVC.h"
#import "FYHFMDBVC.h"

#define SCREEN_SIZE [[UIScreen mainScreen] bounds].size

@interface FYHBaseVC () {
    NSArray *titleArr;
    UIButton *btn;
}

@end

@implementation FYHBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
}

- (void)createUI {
    titleArr = @[@"属性列表", @"XML/JSON", @"对象归档", @"偏好设置", @"数据库FMDB"];
    
    for (int i = 0; i < titleArr.count; i++) {
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20, 70 + 50 * i, SCREEN_SIZE.width / 2 - 40, 44);
        btn.tag = 100 +i;//tag
        [btn setTitle: titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}
//btnClick
- (void)btnClick:(UIButton *)btn {
    switch (btn.tag) {
        case 100:
            //属性列表
            [self.navigationController pushViewController:[[FYHPlistVC alloc] init] animated:YES];
            break;
        case 101:
            //XML/JSON
            [self.navigationController pushViewController:[[FYHAnalysisVC alloc] init] animated:YES];
            break;
        case 102:
            //对象归档
            [self.navigationController pushViewController:[[FYHObjFileVC alloc] init] animated:YES];
            break;
        case 103:
            //偏好设置
            [self.navigationController pushViewController:[[FYHPreferenceSetVC alloc] init] animated:YES];
            break;
        case 104:
            //数据库
            [self.navigationController pushViewController:[[FYHFMDBVC alloc] init] animated:YES];
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
