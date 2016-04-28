//
//  FYHMyTabBarVC.m
//  FYHScroViewLogDemo
//
//  Created by cyberzone on 16/4/27.
//  Copyright © 2016年 FYH. All rights reserved.
//

#import "FYHMyTabBarVC.h"

@interface FYHMyTabBarVC ()

@end

@implementation FYHMyTabBarVC

- (UIViewController *)addViewControllersWithString:(NSString *)nameVC Title:(NSString *)title Image:(NSString *)img AndSelectedImg:(NSString *)selectImg {
    NSLog(@"FYHMyTabBarVC");
    Class controllersName = NSClassFromString(nameVC);
    
    UIViewController *tempController = [[UIViewController alloc] init];
    tempController.title = title;
    tempController.tabBarItem.image = [[UIImage imageNamed:img] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tempController.tabBarItem.selectedImage = [[UIImage imageNamed:selectImg] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:tempController];
    
    NSMutableArray *tempArr = [NSMutableArray arrayWithArray:self.viewControllers];
    [tempArr addObject:nav];
    self.viewControllers = tempArr;
    
    return tempController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
