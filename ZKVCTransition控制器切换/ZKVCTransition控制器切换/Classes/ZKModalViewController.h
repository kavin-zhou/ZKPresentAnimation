//
//  ZKModalViewController.h
//  ZKVCTransition控制器切换
//
//  Created by ZK on 16/2/16.
//  Copyright © 2016年 ZK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZKModalViewController;

@protocol ZKModalViewControllerDelegate <NSObject>

- (void)modalViewControllerDidClickDismissButton:(ZKModalViewController *)modalViewController;

@end

@interface ZKModalViewController : UIViewController

@property (nonatomic, weak) id <ZKModalViewControllerDelegate> delegate;

@end
