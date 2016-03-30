//
//  ViewController.m
//  Runtime1
//
//  Created by 周剑 on 16/3/1.
//  Copyright © 2016年 bukaopu. All rights reserved.
//

#import "ViewController.h"
#import <objc/objc-runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 定义一个整型变量(当前类的实例变量的个数)
    unsigned int ivarCount = 0;
    Ivar *ivars = class_copyIvarList([UIViewController class], &ivarCount);
    for (int i = 0; i < ivarCount; i++) {
//        NSLog(@"%s", ivar_getName(ivars[i]));
    }
    
    // 获取方法
    unsigned int methodCount = 0;
    Method *methods = class_copyMethodList([UIViewController class], &methodCount);
    for (int i = 0; i < methodCount; i++) {
//        NSLog(@"%s", sel_getName(method_getName(methods[i])));
    }
    
#pragma mark - 调换两个方法
    // 获取A.B方法
    Method methodA = class_getInstanceMethod([self class], @selector(doSomethingA));
    Method methodB = class_getInstanceMethod([self class], @selector(doSomethingB));
    // 交换实现
    method_exchangeImplementations(methodA, methodB);
    
    // 调用方法
    [self doSomethingA];
    
}


// 定义两个方法,交换他们的实现
- (void)doSomethingA {
    NSLog(@"AAAAAA");
}

- (void)doSomethingB {
    NSLog(@"BBBBBB");
}


@end
