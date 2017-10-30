//
//  WDTransitioningPushAnimator.m
//  WDNavigationControllerDemo
//
//  Created by apple on 2017/10/30.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WDTransitioningPushAnimator.h"
#import "WDTransitioningHeader.h"

@implementation WDTransitioningPushAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return WDTransitioningPushDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIApplication.sharedApplication.delegate.window.backgroundColor = [UIColor blackColor];
    
    //动画容器View
    UIView * containView = [transitionContext containerView];
    
    //动画时间
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    //fromVC
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    fromVC.view.hidden = YES;
    
    //toVC
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //平移导航栏
    UINavigationBar *navigationBar = [[fromVC navigationController] navigationBar];
    CGRect navigationBarFrame = [navigationBar frame];
    navigationBar.frame = CGRectOffset(navigationBarFrame, CGRectGetWidth(navigationBarFrame), 0);
    
    //fromVC位置不动
    CGRect fromeFrame = [[fromVC view] frame];
    
    //动画前位置  先平移toVC至屏幕外
    CGRect toFrame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.frame = CGRectOffset(toFrame, CGRectGetWidth(toFrame), 0);
    
    [containView addSubview:[fromVC snapshotView]];
    [containView addSubview:[toVC view]];
    
    [UIView animateWithDuration:duration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         //缩放动画
                         fromVC.snapshotView.alpha = 0.5;
                         fromVC.snapshotView.frame = CGRectInset(fromeFrame, 20, 20);
                         
                         //平移动画
                         toVC.view.frame = toFrame;
                         navigationBar.frame = navigationBarFrame;
                     }
                     completion:^(BOOL finished) {
                         //动画完成修改 window背景颜色
                         UIApplication.sharedApplication.delegate.window.backgroundColor = [UIColor whiteColor];
                         
                         //恢复位置
                         navigationBar.frame = navigationBarFrame;
                         
                         fromVC.view.hidden = NO;
                         
                         fromVC.snapshotView.frame = CGRectInset(fromeFrame, 20, 20);
                         
                         toVC.view.frame = toFrame;
                         
                         //删除截屏
                         [[fromVC snapshotView] removeFromSuperview];
                         
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                         
                     }];
}

@end

