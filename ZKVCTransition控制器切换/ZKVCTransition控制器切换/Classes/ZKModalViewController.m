//
//  ZKModalViewController.m
//  ZKVCTransition控制器切换
//
//  Created by ZK on 16/2/16.
//  Copyright © 2016年 ZK. All rights reserved.
//

#import "ZKModalViewController.h"

@interface ZKModalViewController ()

@end

@implementation ZKModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)buttonDidClicked:(id)sender {
    if ([self.delegate respondsToSelector:@selector(modalViewControllerDidClickDismissButton:)]) {
        [self.delegate modalViewControllerDidClickDismissButton:self];
    }
}
@end
