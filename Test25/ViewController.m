//
//  ViewController.m
//  Test25
//
//  Created by chong liu on 2020/1/17.
//  Copyright © 2020 chong liu. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页，仅支持竖屏";
    WKWebView *webview = [[WKWebView alloc] init];
    webview.frame =CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:webview];
    webview.backgroundColor = [UIColor lightGrayColor];
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webview loadRequest:request];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 200, 100, 100);
    [button setTitle:@"下一页" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor lightGrayColor]];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClick:(id)sender {
    [self.navigationController pushViewController:[[TestViewController alloc] init] animated:YES];
}


@end
