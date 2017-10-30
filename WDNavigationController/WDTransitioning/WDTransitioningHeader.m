//
//  WDTransitioningHeader.m
//  WDNavigationControllerDemo
//
//  Created by apple on 2017/10/30.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WDTransitioningHeader.h"

void WDTransitioningMethodExchange(Class class, SEL origSel, SEL altSel) {
    
    Method origMethod = class_getInstanceMethod(class, origSel);
    
    Method altMethod = class_getInstanceMethod(class, altSel);
    
    class_addMethod(class, origSel, class_getMethodImplementation(class, origSel), method_getTypeEncoding(origMethod));
    
    class_addMethod(class, altSel, class_getMethodImplementation(class, altSel), method_getTypeEncoding(altMethod));
    
    method_exchangeImplementations(class_getInstanceMethod(class, origSel), class_getInstanceMethod(class, altSel));
}

//push动画时间
CGFloat const WDTransitioningPushDuration = 0.4f;

//pop动画时间
CGFloat const WDTransitioningPopDuration = 0.4f;

//滑动比例
CGFloat const WDTransitioningSlidingScale = 0.3f;
