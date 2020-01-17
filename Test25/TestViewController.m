//
//  TestViewController.m
//  Test23
//
//  Created by chong liu on 2020/1/17.
//  Copyright © 2020 chong liu. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"第二页，支持横竖屏切换";
    // Do any additional setup after loading the view.
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 150)];
    label.backgroundColor = [UIColor orangeColor];
    label.textColor = [UIColor redColor];
    label.text = @"测试文本";
    [self.view addSubview:label];
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAllButUpsideDown;
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
