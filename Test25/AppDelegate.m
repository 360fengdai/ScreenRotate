//
//  AppDelegate.m
//  Test25
//
//  Created by chong liu on 2020/1/17.
//  Copyright © 2020 chong liu. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    UIStoryboard*sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *controller = [sb instantiateViewControllerWithIdentifier:@"viewcontroller"];
    UINavigationController*navigationViewController = [[UINavigationController alloc] initWithRootViewController:controller];
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    tabbarController.viewControllers = @[navigationViewController, [UIViewController new]];
    self.window.rootViewController = tabbarController;
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
