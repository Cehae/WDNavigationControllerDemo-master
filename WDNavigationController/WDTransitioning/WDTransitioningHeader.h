//
//  WDTransitioningHeader.h
//  WDNavigationControllerDemo
//
//  Created by apple on 2017/10/30.
//  Copyright © 2017年 apple. All rights reserved.
//

#ifndef WDTransitioningHeader_h
#define WDTransitioningHeader_h

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#import "UIViewController+WDTransitioning.h"

#import "WDInteractiveAnimatedTransitioning.h"
#import "WDPercentDrivenInteractiveTransition.h"
#import "WDTransitioningPopAnimator.h"
#import "WDTransitioningPushAnimator.h"

#define WDScreenWidth  ([UIScreen mainScreen].bounds.size.width)
#define WDScreenHeight ([UIScreen mainScreen].bounds.size.height)

extern void WDTransitioningMethodExchange(Class class, SEL origSel, SEL altSel);

extern CGFloat const WDTransitioningPushDuration;

extern CGFloat const WDTransitioningPopDuration;

extern CGFloat const WDTransitioningSlidingScale;

#endif /* WDNavigationControllerHeader_h */
