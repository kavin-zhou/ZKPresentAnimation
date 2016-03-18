//
//  ZKTransitionAnimation.h
//  ZKVCTransition控制器切换
//
//  Created by ZK on 16/2/16.
//  Copyright © 2016年 ZK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZKTransitionAnimation : NSObject <UIViewControllerAnimatedTransitioning>

@end

@interface ZKBouncePersentAnimation : ZKTransitionAnimation

@end

@interface ZKNormalDismissAnimation : ZKTransitionAnimation

@end