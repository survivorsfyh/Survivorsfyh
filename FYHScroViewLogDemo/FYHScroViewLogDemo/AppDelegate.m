//
//  AppDelegate.m
//  FYHScroViewLogDemo
//
//  Created by cyberzone on 16/4/27.
//  Copyright © 2016年 FYH. All rights reserved.
//

#import "AppDelegate.h"
#import "FYHMyTabBarVC.h"//TabBar
#import "FYHMyNavVC.h"//Nav
#import "FYHFirstVC.h"
#import "FYHSecondVC.h"
#import "FYHThirdVC.h"
#import "FYHFourVC.h"
#import "FYHGuidePageVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    NSLog(@"appdelegate");
    [self createUI];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)createUI {
    /*
    FYHMyTabBarVC *tabBarCon = [[FYHMyTabBarVC alloc] init];
    
    //Add VCs
    [tabBarCon addViewControllersWithString:@"FYHFirstVC" Title:@"First" Image:@"DashboardTabBarItemSubscription" AndSelectedImg:nil];
    [tabBarCon addViewControllersWithString:@"FYHSecondVC" Title:@"Second" Image:@"DashboardTabBarItemDailyHot" AndSelectedImg:nil];
    [tabBarCon addViewControllersWithString:@"FYHSecondVC" Title:@"Third" Image:@"DashboardTabbarLife" AndSelectedImg:nil];
    [tabBarCon addViewControllersWithString:@"FYHSecondVC" Title:@"Four" Image:@"DashboardTabBarItemDiscussion" AndSelectedImg:nil];
    
     */
    
    /** Add VCs*/
    FYHMyNavVC *nav = [[FYHMyNavVC alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:[nav addViewControllersWithString:@"FYHFirstVC" Title:@"First" Image:@"DashboardTabBarItemSubscription" AndSelectedImg:nil]];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:[nav addViewControllersWithString:@"FYHSecondVC" Title:@"Second" Image:@"DashboardTabBarItemDailyHot" AndSelectedImg:nil]];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:[nav addViewControllersWithString:@"FYHThirdVC" Title:@"Third" Image:@"DashboardTabbarLife" AndSelectedImg:nil]];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:[nav addViewControllersWithString:@"FYHFourVC" Title:@"Four" Image:@"DashboardTabBarItemDiscussion" AndSelectedImg:nil]];
    /** Add Navs*/
    NSArray *navArr = @[nav1, nav2, nav3, nav4];
    /** Add TabBar*/
    self.tabBar = [[UITabBarController alloc] init];
    self.tabBar.viewControllers = navArr;
    
    FYHGuidePageVC *guidePageVC = [FYHGuidePageVC sharedGuideVC];
    _window.rootViewController = guidePageVC;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
