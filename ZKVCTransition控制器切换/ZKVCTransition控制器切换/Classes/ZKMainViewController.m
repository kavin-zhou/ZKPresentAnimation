//
//  ZKMainViewController.m
//  ZKVCTransition控制器切换
//
//  Created by ZK on 16/2/16.
//  Copyright © 2016年 ZK. All rights reserved.
//

#import "ZKMainViewController.h"
#import "ZKModalViewController.h"
#import "ZKTransitionAnimation.h"
#import "ZKPercentDrivenInteractiveTransition.h"

@interface ZKMainViewController () <ZKModalViewControllerDelegate, UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) ZKBouncePersentAnimation *bouncePersentAnimation;
@property (nonatomic, strong) ZKNormalDismissAnimation *normalDismissAnimation;
@property (nonatomic, strong) ZKPercentDrivenInteractiveTransition *transitionController;

@end

@implementation ZKMainViewController

- (instancetype)init
{
    if (self = [super init]) {
        _bouncePersentAnimation = [[ZKBouncePersentAnimation alloc] init];
        _normalDismissAnimation = [[ZKNormalDismissAnimation alloc] init];
        _transitionController = [[ZKPercentDrivenInteractiveTransition alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)presentBtnClick:(id)sender {
    ZKModalViewController *modalVC = [[ZKModalViewController alloc] init];
    modalVC.delegate = self;
    modalVC.transitioningDelegate = self;
    [self presentViewController:modalVC animated:YES completion:nil];
    
    [self.transitionController wireToViewController:modalVC];
}

// <ZKModalViewControllerDelegate>
- (void)modalViewControllerDidClickDismissButton:(ZKModalViewController *)modalViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

// <UIViewControllerTransitioningDelegate>
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.bouncePersentAnimation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.normalDismissAnimation;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
    return self.transitionController.interacting ? self.transitionController : nil;
}

@end
