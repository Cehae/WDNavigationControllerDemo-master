//
//  WDPercentDrivenInteractiveTransition.h
//  WDNavigationControllerDemo
//
//  Created by apple on 2017/10/30.
//  Copyright © 2017年 apple. All rights reserved.
//  交互控制类

#import <UIKit/UIKit.h>

@interface WDPercentDrivenInteractiveTransition : UIPercentDrivenInteractiveTransition

- (instancetype)initWithGestureRecognizer:(UIPanGestureRecognizer *)gestureRecognizer;

@end
