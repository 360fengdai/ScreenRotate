//
//  UIViewController+ScreenRotate.m
//  Test23
//
//  Created by chong liu on 2020/1/17.
//  Copyright © 2020 chong liu. All rights reserved.
//

#import "UIViewController+ScreenRotate.h"

@implementation UIViewController (ScreenRotate)
- (BOOL)shouldAutorotate{
    // 适配web播放器自动转屏
    if ([self isWebViewPlayVideoInViewController:self]) {
        return YES;
    }else if ([self isKindOfClass:[UINavigationController class]]) {
        // 适配单页面自动转屏
        UINavigationController *navigationController = (UINavigationController *)self;
        return [self shouldAutorotateWithNavigationController:navigationController];
    } else if ([self isKindOfClass:[UITabBarController class]]) {
        // 适配单页面自动转屏
        UITabBarController *tabbarController = (UITabBarController *)self;
        UIViewController *viewController = [tabbarController selectedViewController];
        if ([viewController isKindOfClass:[UINavigationController class]]) {
           UINavigationController *navigationController = (UINavigationController *)viewController;
           return [self shouldAutorotateWithNavigationController:navigationController];
        }else if ([viewController isKindOfClass:[UIViewController class]]) {
           return [viewController shouldAutorotate];
        }
    }
    return NO;
}

- (BOOL)shouldAutorotateWithNavigationController:(UINavigationController *)navigationViewController {
    return [navigationViewController.topViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)orientationMaskWithNavigationController:(UINavigationController *)navigationViewController {
    UIViewController *topViewController = navigationViewController.topViewController;
    return [topViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    // 适配web播放器支持屏幕方向
    if ([self isWebViewPlayVideoInViewController:self]) {
        return UIInterfaceOrientationMaskAll;//web播放器支持的屏幕方向
    } else if ([self isKindOfClass:[UINavigationController class]]) {
        // 适配单页面支持屏幕方向
        UINavigationController *navigationController = (UINavigationController *)self;
        return [self orientationMaskWithNavigationController:navigationController];
    }else if ([self isKindOfClass:[UITabBarController class]]) {
        // 适配单页面支持屏幕方向
        UITabBarController *tabbarController = (UITabBarController *)self;
        UIViewController *viewController = [tabbarController selectedViewController];
        if ([viewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *navigationController = (UINavigationController *)viewController;
            return [self orientationMaskWithNavigationController:navigationController];
        }else if ([viewController isKindOfClass:[UIViewController class]]) {
            return [viewController supportedInterfaceOrientations];
        }
    }
    // 默认仅支持竖屏
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)isWebViewPlayVideoInViewController:(UIViewController *)viewConroller {
    NSString *className = NSStringFromClass([viewConroller class]);
    // 适配web播放器
    if ([className isEqualToString:@"AVFullScreenViewController"]) {
        return YES;
    }else if([className isEqualToString:@"UIViewController"]) {
        // 适配web播放器
        if (viewConroller.presentedViewController) {
            UIViewController *controller = viewConroller.presentedViewController;
            if ([NSStringFromClass([controller class]) isEqualToString:@"AVFullScreenViewController"]) {
                return YES;
            }
        }
    }
    return NO;
}

@end
