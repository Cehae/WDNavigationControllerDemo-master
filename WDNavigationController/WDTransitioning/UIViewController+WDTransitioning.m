//
//  UIViewController+WDTransitioning.m
//  WDNavigationControllerDemo
//
//  Created by apple on 2017/10/30.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "UIViewController+WDTransitioning.h"
#import <objc/runtime.h>
#import "WDTransitioningHeader.h"

@implementation UIViewController (WDTransitioning)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        WDTransitioningMethodExchange([self class], @selector(viewWillDisappear:), @selector(wd_viewWillDisappear:));
    });
}

- (void)wd_viewWillDisappear:(BOOL)animated {
    
    [self wd_viewWillDisappear:animated];
    
    if ([self isMovingFromParentViewController]) {
        self.snapshotView = [[[self navigationController] view] snapshotViewAfterScreenUpdates:NO];
    }
}

-(UIView *)snapshotView
{
    return objc_getAssociatedObject(self, @selector(snapshotView));
}

-(void)setSnapshotView:(UIView *)snapshotView
{
    if (self.snapshotView != snapshotView)
    {
        objc_setAssociatedObject(self, @selector(snapshotView), snapshotView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}
@end
