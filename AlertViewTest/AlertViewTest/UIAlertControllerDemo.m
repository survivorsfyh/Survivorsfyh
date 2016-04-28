//
//  TestViewController.m
//  AlertViewTest
//
//  Created by cyberzone on 16/4/18.
//  Copyright © 2016年 FYH. All rights reserved.
//

#import "UIAlertControllerDemo.h"
#import "FYHViewController.h"

@implementation UIAlertControllerDemo {
    UIAlertController *_alertView;
    UIAlertController *_upAlertView;
}

- (void)viewDidAppear:(BOOL)animated {
    [self myAlertController];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (void)myAlertController {
    //创建 Login 相关
    /*
     UIAlertControllerStyleActionSheet = 0,
     UIAlertControllerStyleAlert
     */
    _alertView = [UIAlertController alertControllerWithTitle:@"AlertViewDemo" message:@"AlertView 创建" preferredStyle:UIAlertControllerStyleAlert];
    //创建上拉提示相关
    _upAlertView = [UIAlertController alertControllerWithTitle:@"Save Or Delete" message:@"Y or N" preferredStyle:UIAlertControllerStyleActionSheet];
   
#pragma mark - AlertAction 添加提示框内容按钮
    /*
     UIAlertActionStyleDefault = 0,
     UIAlertActionStyleCancel,
     UIAlertActionStyleDestructive
     */
    //取消返回按钮
    [_alertView addAction:[UIAlertAction actionWithTitle:@"Return" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        [self presentViewController:[[FYHViewController alloc] init] animated:YES completion:nil];
    }]];
    
    //登录按钮
    UIAlertAction *logAction =[UIAlertAction actionWithTitle:@"Login" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        logAction.enabled = NO;//显示对话框前,冻结按钮状态! ***
        
        //获取 TextField 的值
        UITextField *login = _alertView.textFields.firstObject;
        UITextField *passWord = _alertView.textFields.lastObject;
        NSLog(@"login:%@ --- passWord:%@", login, passWord);
        
        //移除创建的通知
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
        
        [self presentViewController:_upAlertView animated:YES completion:^{
            //
            NSLog(@"上拉相关提示框 ing ... ");
        }];
//        [self presentViewController:[[FYHViewController alloc] init] animated:YES completion:nil];
    }];
    [_alertView addAction:logAction];
    
    //********************** 上拉提示相关
    [_upAlertView addAction:[UIAlertAction actionWithTitle:@"Return" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Cancel --- 取消类型");
        //取消
        [self dismissViewControllerAnimated:YES completion:^{
            //
        }];
    }]];
    [_upAlertView addAction:[UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Destructive --- 红色字体");
        //删除
        [self dismissViewControllerAnimated:YES completion:^{
            //
        }];
    }]];
    [_upAlertView addAction:[UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Default --- 普通类型");
        //保存
        [self dismissViewControllerAnimated:YES completion:^{
            //
        }];
    }]];
    
#pragma mark - TextField 创建相关
    [_alertView addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Login";
    }];
    [_alertView addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"PassWord";
        textField.secureTextEntry = YES;
        
        //设置字符限制
        /*
         实现该方法需要实现 UIAlertView 委托方法,因为在 UIAlertController 中没有相对应的委托方法,所有需要向 TextField 中添加 Observer 模式定义对象间一对多的依赖关系,从而当一个对象的状态发生改变时,所依赖它的对象即得到通知并被自动更新.
         注:添加通知后,记得点击事件内移除.
         */
        //创建通知监听
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alertTextFieldDidChange:) name:UITextFieldTextDidChangeNotification object:textField];
    }];
    
#pragma mark - 加载样式展示
    [self presentViewController:_alertView animated:YES completion:^{
        //
        NSLog(@"开始加载喽 AlertViewing ... ");
    }];
}

#pragma mark - TextField 状态相关设置
- (void)alertTextFieldDidChange:(NSNotification *)notifcation {
    UIAlertController *alertCon = (UIAlertController *)self.presentedViewController;
    
    if (alertCon) {
        //登录
        UITextField *passWord = alertCon.textFields.lastObject;//获取对应的 textField 对话框
        UIAlertAction *goAction = alertCon.actions.lastObject;
        goAction.enabled = passWord.text.length > 2;//限制文字个数
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
