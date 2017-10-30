//
//  WDNavigationController.m
//  WDNavigationControllerDemo
//
//  Created by apple on 2017/10/30.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WDNavigationController.h"
#import "WDTransitioningHeader.h"

@interface WDNavigationController ()

@property (nonatomic, strong) WDInteractiveAnimatedTransitioning *animatedTransition;
@end

@interface WDNavigationController ()

@end

@implementation WDNavigationController

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        WDTransitioningMethodExchange([self class], @selector(pushViewController:animated:), @selector(wd_pushViewController:animated:));
    });
}

- (void)wd_pushViewController:(UIViewController*)viewController animated:(BOOL)animated{
    
    if ([self topViewController] && ![[self topViewController] snapshotView]) {
        self.topViewController.snapshotView = [[self view] snapshotViewAfterScreenUpdates:NO];
    }
    [self wd_pushViewController:viewController animated:animated];
}

#pragma mark - lazyLoading
-(WDInteractiveAnimatedTransitioning *)animatedTransition
{
    if (!_animatedTransition) {
        _animatedTransition = [[WDInteractiveAnimatedTransitioning alloc] init];
    }
    return _animatedTransition;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self.animatedTransition;
    
    //自定义手势
    UIPanGestureRecognizer *interactiveTransitionRecognizer;
    interactiveTransitionRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(interactiveTransitionRecognizerAction:)];
    
    [self.view addGestureRecognizer:interactiveTransitionRecognizer];
}

- (void)interactiveTransitionRecognizerAction:(UIPanGestureRecognizer *)gestureRecognizer
{
    
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStatePossible:
            break;
            
        case UIGestureRecognizerStateBegan: {
            
            self.animatedTransition.gestureRecognizer = gestureRecognizer;
            
            [self popViewControllerAnimated:YES];
            
        }break;
            
        case UIGestureRecognizerStateChanged:
            break;

        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded: {
            
            self.animatedTransition.gestureRecognizer = nil;
            
        }break;
    }
}

#pragma mark - 注意
#warning 注意
+ (void)initialize {
    //设置Bar
    UINavigationBar *bar = [UINavigationBar appearance];
    
    //下面这句话至关重要，如果bar.translucent为NO，controller中self.view的原点是从导航栏左下角开始计算，这样在Push或者Pop的时候会有BUG，所以在继承WDNavigationController自定义导航栏的时候也请将bar.translucent设置为NO。
    
    [bar setTranslucent:YES];
}

@end
