//
//  WDPercentDrivenInteractiveTransition.m
//  WDNavigationControllerDemo
//
//  Created by apple on 2017/10/30.
//  Copyright © 2017年 apple. All rights reserved.
//  

#import "WDPercentDrivenInteractiveTransition.h"
#import "WDTransitioningHeader.h"

@interface WDPercentDrivenInteractiveTransition()

@property (nonatomic, strong, readonly) UIPanGestureRecognizer *gestureRecognizer;

@end

@implementation WDPercentDrivenInteractiveTransition

- (instancetype)initWithGestureRecognizer:(UIPanGestureRecognizer *)gestureRecognizer
{
    self = [super init];
    if (self)
    {
        _gestureRecognizer = gestureRecognizer;
        
        [_gestureRecognizer addTarget:self action:@selector(gestureRecognizeDidUpdate:)];
    }
    return self;
}

#pragma mark - UIViewControllerInteractiveTransitioning

- (void)startInteractiveTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    [super startInteractiveTransition:transitionContext];
}


- (void)gestureRecognizeDidUpdate:(UIPanGestureRecognizer *)gestureRecognizer
{
    CGFloat scale = [self percentForGesture:gestureRecognizer];
    
    switch (gestureRecognizer.state)
    {
        case UIGestureRecognizerStateBegan:
            break;
            
        case UIGestureRecognizerStateChanged:{
            
            [self updateInteractiveTransition:scale];
            
        }break;
            
            
        case UIGestureRecognizerStateEnded:{
            
            if (scale < WDTransitioningSlidingScale){
                
                [self cancelInteractiveTransition];
            }
            else{
                
                [self finishInteractiveTransition];
            }
            
        }break;
            
            
        default:{
            [self cancelInteractiveTransition];
        }break;
            
    }
}

//滑动的距离所占屏幕的比例
- (CGFloat)percentForGesture:(UIPanGestureRecognizer *)gesture
{
    CGPoint translation = [gesture translationInView:gesture.view];
    
    CGFloat scale = translation.x / WDScreenWidth;
    
    scale = scale < 0 ? 0 : scale;
    
    return scale;
}

- (void)dealloc
{
    [self.gestureRecognizer removeTarget:self action:@selector(gestureRecognizeDidUpdate:)];
}

@end
