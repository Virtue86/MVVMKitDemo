//
//  UIView+TTConfigure.h
//  tangtang
//
//  Created by Virtue on 2018/3/21.
//  Copyright © 2018年 pengTang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPViewModelProtocol.h"

@interface UIView (TTConfigure)
/**
 *  根据model配置UIView，设置UIView内容
 */
- (void)TT_configureViewWithModel:(id)model;

/**
 *  根据viewModel配置UIView，设置UIView内容
 */
- (void)TT_configureViewWithViewModel:(id<EPViewModelProtocol>)viewModel;
@end
