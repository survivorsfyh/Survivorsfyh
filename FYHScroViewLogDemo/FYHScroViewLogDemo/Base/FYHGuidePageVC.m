//
//  FYHGuidePageVC.m
//  FYHScroViewLogDemo
//
//  Created by cyberzone on 16/4/27.
//  Copyright © 2016年 FYH. All rights reserved.
//

#import "FYHGuidePageVC.h"
#import "FYHLoginVC.h"
#import "AppDelegate.h"
#import "FYHMyTabBarVC.h"

#define FRAME_SIZE self.view.frame.size

@interface FYHGuidePageVC () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scView;
@property (nonatomic, strong) UIImageView *imgViewPic;
@property (nonatomic, strong) NSMutableArray *picArr;
@property (nonatomic, strong) UIPageControl *pageCon;

@property (nonatomic, strong) UIButton *btn;

@property (nonatomic, strong) NSString *pageType;

@end

@implementation FYHGuidePageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"FYHGuidePageVC");
    self.pageType = @"fyh";
    self.picArr = @[
                    [UIImage imageNamed:@"guidePage_01"],
                    [UIImage imageNamed:@"guidePage_02"],
                    [UIImage imageNamed:@"guidePage_03"],
                    [UIImage imageNamed:@"guidePage_04"]
                    ].mutableCopy;
    
    [self createScrollerView];
    [self createPageControl];
}

#pragma mark - 创建 VC
+ (instancetype)sharedGuideVC {
    static FYHGuidePageVC *guidePageVC = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        guidePageVC = [[FYHGuidePageVC alloc] init];
    });
    return guidePageVC;
}
#pragma mark - ScrollerViewSomethings
- (void)createScrollerView {
    self.scView = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.scView.delegate = self;
    [self.view addSubview:self.scView];
    self.scView.contentSize = CGSizeMake(4 * FRAME_SIZE.width, FRAME_SIZE.height);
    self.scView.pagingEnabled = YES;
    self.scView.bounces = NO;
    self.scView.showsHorizontalScrollIndicator = NO;
    
    //创建 imageView
    for (int i = 1; i <= self.picArr.count; i++) {
        self.imgViewPic = [[UIImageView alloc] initWithFrame:CGRectMake(FRAME_SIZE.width * (i - 1), 0, FRAME_SIZE.width, FRAME_SIZE.height)];
        self.imgViewPic.image = [self.picArr objectAtIndex:i - 1];//pic
        self.imgViewPic.tag = 100 + i;//tag
        [self.scView addSubview:self.imgViewPic];
        
        NSLog(@"picArr.count --- %lu", (unsigned long)self.picArr.count);
        //BtnSomethings self.picArr.count + 1
        if (i == 4) {//pic 起始数为1,Arr 起始为0,所以 lastIndex 需要加1 !!!!!!!!
            NSLog(@"lastPicArr --- %ld", (unsigned long)self.picArr.count);
            
            NSArray *titleArr = @[@"login", @"logon"];
            for (int j = 0; j < titleArr.count; j++) {
                NSLog(@"titltArr --- %ld", (unsigned long)titleArr.count);
                self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
                self.btn.frame = CGRectMake((FRAME_SIZE.width - 280) / 2 + 3 * FRAME_SIZE.width + 160 * j, FRAME_SIZE.height - 120, 120, 44);
                self.btn.tag = 1000 + j;//tag
                NSLog(@"btnTag --- %d",self.btn.tag);
                [self.btn setTitle:titleArr[j] forState:UIControlStateNormal];
                [self.btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];//点击事件
                [self.scView addSubview:self.btn];
                //LayerSomethings
                self.btn.layer.borderWidth = 2;
                self.btn.layer.borderColor = [UIColor colorWithRed:0.656 green:0.688 blue:0.869 alpha:1.0].CGColor;
                self.btn.layer.cornerRadius = 5;
            }
        }
    }
}
#pragma mark - PageControl
- (void)createPageControl {
    self.pageCon = [[UIPageControl alloc] initWithFrame:CGRectMake((FRAME_SIZE.width - 40) / 2, FRAME_SIZE.height - 50, 40, 20)];
    self.pageCon.numberOfPages = 4;
    self.pageCon.currentPageIndicatorTintColor = [UIColor redColor];//IndexBgColor
    self.pageCon.pageIndicatorTintColor = [UIColor blackColor];//BgColor
    [self.view addSubview:self.pageCon];
}
#pragma mark - 相关方法
/** ScrollView 协议方法相关*/
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.pageCon.currentPage = self.scView.contentOffset.x / FRAME_SIZE.width;\
    NSLog(@"pageCon.currentPage --- %d", self.pageCon.currentPage);
}
/** Btn 点击事件*/
- (void)btnClick:(UIButton *)btn {
    if (btn.tag == 1000) {
        [self presentViewController:[[FYHLoginVC alloc] init] animated:YES completion:^{
            NSLog(@"登录注册");
        }];
    }
    if (btn.tag == 1001) {
        NSLog(@"内容页面");
        AppDelegate *tempAppDelegate = [UIApplication sharedApplication].delegate;
        tempAppDelegate.window.rootViewController = tempAppDelegate.tabBar;
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
