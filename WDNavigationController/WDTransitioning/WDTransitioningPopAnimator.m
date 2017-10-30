//
//  WDTransitioningPopAnimator.m
//  WDNavigationControllerDemo
//
//  Created by apple on 2017/10/30.
//  Copyright © 2017年 apple. All rights reserved.
//  

#import "WDTransitioningPopAnimator.h"
#import "WDTransitioningHeader.h"

@implementation WDTransitioningPopAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return WDTransitioningPopDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIApplication.sharedApplication.delegate.window.backgroundColor = [UIColor blackColor];
    
    //动画容器View
    UIView * containView = [transitionContext containerView];
    
    //动画时间
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    //fromVC
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    //toVC
    UIViewController *toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //fromFrame
    CGRect fromFrame = [[fromVC view] frame];
    
    //toFrame
    CGRect toFrame = [transitionContext finalFrameForViewController:toVC];
    
    
    fromVC.navigationController.navigationBar.hidden = YES;
    
    toVC.view.hidden = YES;
    toVC.snapshotView.alpha = 0.5;
    
    //先将toFrame.snapshotView缩放
    toVC.snapshotView.frame = CGRectInset(toFrame, 20, 20);
    
    
    [[fromVC view] addSubview:[fromVC snapshotView]];
    
    [containView addSubview:[toVC view]];
    [containView addSubview:[toVC snapshotView]];
    [containView sendSubviewToBack:[toVC snapshotView]];
    
    [UIView animateWithDuration:duration
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         
                         //平移fromVC
                         fromVC.view.frame = CGRectOffset(fromFrame, CGRectGetWidth(fromFrame), 0);
                         
                         //将toVC.snapshotView位置恢复
                         toVC.snapshotView.alpha = 1.0;
                         toVC.snapshotView.frame = toFrame;
                         
                     }
                     completion:^(BOOL finished) {
                         
                         UIApplication.sharedApplication.delegate.window.backgroundColor = [UIColor whiteColor];
                         
                         toVC.navigationController.navigationBar.hidden = NO;
                         toVC.view.hidden = NO;
                         
                         [[fromVC snapshotView] removeFromSuperview];
                         [[toVC snapshotView] removeFromSuperview];
                         
                         if (![transitionContext transitionWasCancelled]) {
                             toVC.snapshotView = nil;
                         }
                         
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                     }];

}
@end
