//
//  WDInteractiveAnimatedTransitioning.h
//  WDNavigationControllerDemo
//
//  Created by apple on 2017/10/30.
//  Copyright © 2017年 apple. All rights reserved.
//  转场动画代理

#import <UIKit/UIKit.h>

@interface WDInteractiveAnimatedTransitioning : NSObject<UINavigationControllerDelegate>

@property (nonatomic, strong) UIPanGestureRecognizer *gestureRecognizer;

@end
