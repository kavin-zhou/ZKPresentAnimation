//
//  ZKPercentDrivenInteractiveTransition.h
//  ZKVCTransition控制器切换
//
//  Created by ZK on 16/2/16.
//  Copyright © 2016年 ZK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZKPercentDrivenInteractiveTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign) BOOL interacting;

- (void)wireToViewController:(UIViewController *)viewController;

@end
