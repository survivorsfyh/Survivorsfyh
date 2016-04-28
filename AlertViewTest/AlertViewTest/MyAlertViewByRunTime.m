//
//  MyAlertViewByRunTime.m
//  AlertViewTest
//
//  Created by cyberzone on 16/4/18.
//  Copyright © 2016年 FYH. All rights reserved.
//

#import "MyAlertViewByRunTime.h"

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

@implementation UIAlertView (ActionBlock)

//调自己方法
- (void)setCallBack:(AlertCallBack)callBack {
    //objc设置相关对象
    /*
     //不自动
     OBJC_ASSOCIATION_ASSIGN = 0,            指定一个弱引用相关联的对象
     OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1,  指定一个强引用相关联的object.
     OBJC_ASSOCIATION_COPY_NONATOMIC = 3,    指定相关的对象被复制。
    //协议自动
     OBJC_ASSOCIATION_RETAIN = 01401,        指定一个强引用相关联的 object.
     OBJC_ASSOCIATION_COPY = 01403           指定相关的对象被复制。
     */
    objc_setAssociatedObject(self, @selector(callBack), callBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.delegate = self;//Delegate!!!!!
}

//回调 self
- (AlertCallBack)callBack {
    return objc_getAssociatedObject(self, @selector(callBack));
}

#pragma mark - 设置 Delegate 方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self.callBack) {
        //相对应的 index
        self.callBack(alertView, buttonIndex);
    }
}


@end
