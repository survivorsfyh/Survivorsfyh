//
//  FYHMyTabBarVC.h
//  FYHScroViewLogDemo
//
//  Created by cyberzone on 16/4/27.
//  Copyright © 2016年 FYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FYHMyTabBarVC : UITabBarController

//vc title image selectedImg
- (UIViewController *)addViewControllersWithString:(NSString *)nameVC Title:(NSString *)title Image:(NSString *)img AndSelectedImg:(NSString *)selectImg;

@end
