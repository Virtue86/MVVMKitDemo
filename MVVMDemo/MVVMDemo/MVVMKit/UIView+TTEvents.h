//
//  UIView+TTEvents.h
//  tangtang
//
//  Created by Virtue on 2018/3/21.
//  Copyright © 2018年 pengTang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPViewProtocol.h"

/**
 这个 类的作用就是实现与其一起绑定的viewManager，并且把自身的事件传输出去给viewManager处理

 */
NS_ASSUME_NONNULL_BEGIN

typedef void (^viewEventsBlock)(NSString *info);


@interface UIView (TTEvents)
/**
 *  viewDelegate 传递事件
 */
@property (nullable, nonatomic, weak) id<EPViewProtocol> viewDelegate;

/**
 *  block 传递事件
 */
@property (nonatomic, copy) viewEventsBlock viewEventsBlock;

/**
 *  将view中的事件交由viewManger处理
 */
- (void)TT_viewWithViewManger:(id<EPViewProtocol>)viewManger;

@end
NS_ASSUME_NONNULL_END
