//
//  ZKTransitionAnimation.m
//  ZKVCTransition控制器切换
//
//  Created by ZK on 16/2/16.
//  Copyright © 2016年 ZK. All rights reserved.
//

#import "ZKTransitionAnimation.h"

@implementation ZKTransitionAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.8f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
}

@end


@implementation ZKBouncePersentAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.8f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    // get toVC from transitionContext
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    // init farme for toVC
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.frame = CGRectOffset(finalFrame, 0, screenBounds.size.height);
    // add toVC's view to containerView
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    // do animation
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration delay:0.f usingSpringWithDamping:0.6f initialSpringVelocity:0.f options:UIViewAnimationOptionCurveLinear animations:^{
        toVC.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

@end

@implementation ZKNormalDismissAnimation

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    return 1.5f;
    
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    //1
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //2
    
    CGRect initRect = [transitionContext initialFrameForViewController:fromVC];
    
    CGRect finalRect = CGRectOffset(initRect, 0, [[UIScreen mainScreen]bounds].size.height);
    
    //3
    
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:toVC.view];
    
    [containerView sendSubviewToBack:toVC.view];
    
    //4
    
//    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0f usingSpringWithDamping:0.2f initialSpringVelocity:0.0f options:UIViewAnimationOptionCurveLinear animations:^{
//        
//        fromVC.view.frame = finalRect;
//        
//    } completion:^(BOOL finished) {
//        
//        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
//        
//    }];
    [UIView animateWithDuration:0.2 animations:^{
        fromVC.view.frame = finalRect;
    }completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
}

//- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
//{
//    return 0.8f;
//}
//
//- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
//{
//    // get toVC from transitionContext
//    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    // init farme for toVC
//    CGRect screenBounds = [UIScreen mainScreen].bounds;
//    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
//    toVC.view.frame = CGRectOffset(finalFrame, 0, -screenBounds.size.height);
//    // add toVC's view to containerView
//    UIView *containerView = [transitionContext containerView];
//    [containerView addSubview:toVC.view];
//    // do animation
//    NSTimeInterval duration = [self transitionDuration:transitionContext];
//    [UIView animateWithDuration:duration delay:0.f usingSpringWithDamping:0.6f initialSpringVelocity:0.f options:UIViewAnimationOptionCurveLinear animations:^{
//        toVC.view.frame = finalFrame;
//    } completion:^(BOOL finished) {
//        [transitionContext completeTransition:YES];
//    }];
//}

@end

