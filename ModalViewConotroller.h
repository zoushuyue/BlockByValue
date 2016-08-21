//
//  ModalViewConotroller.h
//  BlockByValue
//
//  Created by mac1 on 16/8/21.
//  Copyright © 2016年 fuxi. All rights reserved.
//

#import <UIKit/UIKit.h>

//这里要定义一个block的别名(申明) 类型 ----> void (^) (NSString *text)
typedef void(^ChangeTextBlock) (NSString *text);

@interface ModalViewConotroller : UIViewController

//定义一个block
@property (nonatomic, copy) ChangeTextBlock block;

@end
