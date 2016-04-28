//
//  FYHMyNavVC.h
//  FYHScroViewLogDemo
//
//  Created by cyberzone on 16/4/28.
//  Copyright © 2016年 FYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FYHMyNavVC : UINavigationController

- (UIViewController *)addViewControllersWithString:(NSString *)nameVC Title:(NSString *)title Image:(NSString *)img AndSelectedImg:(NSString *)selectImg;

@end
