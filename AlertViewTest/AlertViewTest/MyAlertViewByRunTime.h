//
//  MyAlertViewByRunTime.h
//  AlertViewTest
//
//  Created by cyberzone on 16/4/18.
//  Copyright © 2016年 FYH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AlertCallBack)(UIAlertView *, NSUInteger);

@interface UIAlertView (ActionBlock) <UIAlertViewDelegate>

@property (nonatomic, copy) AlertCallBack callBack;

@end
