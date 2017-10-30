//
//  WDTestNavigationController.m
//  WDNavigationControllerDemo
//
//  Created by apple on 2017/10/30.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WDTestNavigationController.h"
#import "WDTestNavigationHeader.h"

@interface WDTestNavigationController ()

@end

@implementation WDTestNavigationController

//自定义自己的导航栏样式
+ (void)initialize {
    //设置Bar
    UINavigationBar *bar = [UINavigationBar appearance];
    
    UIImage * image = [UIImage imageWithColor:[UIColor whiteColor]];
    
    [bar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [bar setShadowImage:image];
    
    [bar setTitleTextAttributes:@{
                                  NSFontAttributeName :[UIFont fontWithName:@"PingFangSC-Regular" size:20],
                                  NSForegroundColorAttributeName:RGBA(0,78,79,1)
                                  }];
    
    // 设置item
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    [item setTitleTextAttributes:@{
                                   NSForegroundColorAttributeName:RGBA(0,78,79,1),
                                   NSFontAttributeName:[UIFont systemFontOfSize:16]
                                   }forState:UIControlStateNormal];
    [item setTitleTextAttributes:@{
                                   NSForegroundColorAttributeName:RGBA(0,78,79,1),
                                   NSFontAttributeName:[UIFont systemFontOfSize:16]
                                   }forState:UIControlStateHighlighted];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

#pragma mark - 拦截push,统一设置leftBarButtonItem
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"return"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"return"] forState:UIControlStateHighlighted];
        button.frame = CGRectMake(0, 0, 30, 40);
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    
    [self popViewControllerAnimated:YES];
}
@end
