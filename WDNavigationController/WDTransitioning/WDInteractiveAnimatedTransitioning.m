//
//  WDInteractiveAnimatedTransitioning.m
//  WDNavigationControllerDemo
//
//  Created by apple on 2017/10/30.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WDInteractiveAnimatedTransitioning.h"
#import "WDTransitioningHeader.h"

@interface WDInteractiveAnimatedTransitioning()

@property (nonatomic, strong) WDPercentDrivenInteractiveTransition  *interactiveTransition;

@property (nonatomic, strong) WDTransitioningPushAnimator *pushAnimator;

@property (nonatomic, strong) WDTransitioningPopAnimator *popAnimator;

@end

@implementation WDInteractiveAnimatedTransitioning

#pragma mark - UINavigationControllerDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush) {
        
        return self.pushAnimator;
        
    }else if (operation == UINavigationControllerOperationPop){
        
        return self.popAnimator;
    }
    return nil;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(nonnull id<UIViewControllerAnimatedTransitioning>)animationController
{
    return self.gestureRecognizer ? self.interactiveTransition : nil;
}

#pragma mark - lazyLoading

-(WDPercentDrivenInteractiveTransition *)interactiveTransition
{
    if (!_interactiveTransition) {
        _interactiveTransition = [[WDPercentDrivenInteractiveTransition alloc] initWithGestureRecognizer:self.gestureRecognizer];
    }
    return _interactiveTransition;
}

-(WDTransitioningPushAnimator *)pushAnimator
{
    if (!_pushAnimator) {
        _pushAnimator = [[WDTransitioningPushAnimator alloc] init];
    }
    return _pushAnimator;
}

-(WDTransitioningPopAnimator *)popAnimator
{
    if (!_popAnimator) {
        _popAnimator = [[WDTransitioningPopAnimator alloc] init];
    }
    return _popAnimator;
}
@end
