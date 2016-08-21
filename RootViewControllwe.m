//
//  RootViewControllwe.m
//  BlockByValue
//
//  Created by mac1 on 16/8/21.
//  Copyright © 2016年 fuxi. All rights reserved.
//

#import "RootViewControllwe.h"
#import "ModalViewConotroller.h"

@interface RootViewControllwe () {
    
    ModalViewConotroller *_modalViewController;
}

@end

@implementation RootViewControllwe

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1) 设置背景颜色
    self.view.backgroundColor = [UIColor cyanColor];
    
    //2) 设置一个Label
    //a) 创建一个Label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(25, 100, 270, 30)];
    //b) 设置该label的tag
    label.tag = 1000;
    //c) 设置label的内容
    label.text = @"Block的传值";
    //d) 设置背景颜色
    label.backgroundColor = [UIColor orangeColor];
    //e) 设置字体颜色
    label.textColor = [UIColor whiteColor];
    //f) 设置居中方式
    label.textAlignment = NSTextAlignmentCenter;
    //g) 添加label
    [self.view addSubview:label];
    
    //3) 设置跳转你的button
    //a) 创建button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    //b) 设置其frame
    button.frame = CGRectMake(0, 0, 200, 30);
    //c) 设置其在屏幕的中心
    button.center = self.view.center;
    //d) 设置背景颜色
    button.backgroundColor = [UIColor lightGrayColor];
    //e) 设置显示的内容
    [button setTitle:@"跳转" forState:UIControlStateNormal];
    //f) 设置相应事件
    [button addTarget:self
               action:@selector(buttonAction:)
     forControlEvents:UIControlEventTouchUpInside];
    //g) 添加到页面上
    [self.view addSubview:button];
    
    //4) 初始化模态视图
    _modalViewController = [[ModalViewConotroller alloc] init];
    
}

#pragma mark - 点击的按键响应
- (void) buttonAction: (UIButton *) button {
    
    //1. 实现block，使用__block的原因：是防止内存的泄露
    __block RootViewControllwe *rootVC = self;
    
    //2. block的初始化
    _modalViewController.block = ^(NSString *text) {
        //如果不用__block的对象，那么这里会提示一个警告 ------> 内存的
        UILabel *label = (UILabel *) [rootVC.view viewWithTag:1000];
        label.text = text;
    };
    
    //3. 弹窗模式
    _modalViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    //4. 模态视图
    [self presentViewController:_modalViewController animated:YES completion:nil];
    
}

@end

