//
//  ZKPercentDrivenInteractiveTransition.m
//  ZKVCTransition控制器切换
//
//  Created by ZK on 16/2/16.
//  Copyright © 2016年 ZK. All rights reserved.
//

#import "ZKPercentDrivenInteractiveTransition.h"

@interface ZKPercentDrivenInteractiveTransition()
@property (nonatomic, assign) BOOL shouldComplete;
@property (nonatomic, strong) UIViewController *persentingVC;
@end

@implementation ZKPercentDrivenInteractiveTransition

- (void)wireToViewController:(UIViewController *)viewController
{
    self.persentingVC = viewController;
    [self prepareGestureRecognizerInView:viewController.view];
}

- (void)prepareGestureRecognizerInView:(UIView *)view
{
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGestureRecognizer:)];
    [view addGestureRecognizer:gesture];
}

- (void)handlePanGestureRecognizer:(UIPanGestureRecognizer *)gesture
{
    CGPoint translation = [gesture translationInView:gesture.view.superview];
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan: {
            self.interacting = YES;
            [self.persentingVC dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case UIGestureRecognizerStateChanged: {
            CGFloat fraction = translation.y / [UIScreen mainScreen].bounds.size.height;
            NSLog(@"----%f",translation.y);

            // limit fraction between 0 and 1
            fraction = fminf(fmaxf(fraction, 0.f), 1.f);
            self.shouldComplete = (fraction > 0.5);
            
            [self updateInteractiveTransition:fraction*0.2];
        }
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled: {
            self.interacting = NO;
            if (!self.shouldComplete || gesture.state == UIGestureRecognizerStateCancelled) {
                [self cancelInteractiveTransition];
            }
            else {
                [self finishInteractiveTransition];
            }
        }
            break;
            
        default:
            break;
    }
}

@end
