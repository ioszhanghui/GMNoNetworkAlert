//
//  GMAppDelegate.m
//  GMNoNetworkAlert
//
//  Created by ioszhanghui@163.com on 11/06/2019.
//  Copyright (c) 2019 ioszhanghui@163.com. All rights reserved.
//

#import "GMAppDelegate.h"
#import "GMNetworkManager.h"
#import "UIViewController+Network.h"


@implementation GMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [GMNetworkManager startNetworkNotifier];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(networkChange:) name:kReachabilityChangedNotification object:nil];
    
    [self addFirstShow];    
   
    return YES;
}

-(void)addFirstShow{
    if (![GMNetworkManager shareNetworkManager].availableNetwork) {
        [[self getCurrentViewController]showNetWorkAlert];
    }
}

-(void)networkChange:(NSNotification*)noti{
    
    if (![GMNetworkManager shareNetworkManager].availableNetwork) {
        //获取的 网络
        [[self getCurrentViewController]showNetWorkAlert];
        
    }else{
        [[self getCurrentViewController]hiddenNetworkAlert];
    }
}
/*获取当前控制器*/
-(UIViewController *)getCurrentViewController{
    UIViewController * rootViewController = [self getApplicationDelegate].window.rootViewController;
    return [self getCurrentControllerFrom:rootViewController];
}

/*从一个控制器 当中拿到当前控制器啊*/
-(UIViewController*)getCurrentControllerFrom:(UIViewController*)viewController{
    
    if([viewController isKindOfClass:[UINavigationController class]]){
        //如果是导航控制器
        UINavigationController * nviController = (UINavigationController*)viewController;
        return [nviController.viewControllers lastObject];
    }else if ([viewController isKindOfClass:[UITabBarController class]]){
        //如果当前控制器是 Tabbar
        UITabBarController * tabbarController =(UITabBarController*)viewController;
        return [self getCurrentControllerFrom:tabbarController.selectedViewController];
    }else if (viewController.presentedViewController != nil){
        //如果当前是 普通的控制器
        return [self getCurrentControllerFrom:viewController.presentedViewController];
    }
    return viewController;
}


-(id<UIApplicationDelegate>)getApplicationDelegate{
    return [UIApplication sharedApplication].delegate;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
