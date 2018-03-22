//
//  UIView+TTEvents.m
//  tangtang
//
//  Created by Virtue on 2018/3/21.
//  Copyright © 2018年 pengTang. All rights reserved.
//

#import "UIView+TTEvents.h"
#import <objc/runtime.h>

@implementation UIView (TTEvents)
- (id<EPViewProtocol>)viewDelegate {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setViewDelegate:(id<EPViewProtocol>)viewDelegate {
    objc_setAssociatedObject(self, @selector(viewDelegate), viewDelegate, OBJC_ASSOCIATION_ASSIGN);
}

- (viewEventsBlock)viewEventsBlock {
    return objc_getAssociatedObject(self, @selector(viewEventsBlock));
}

- (void)setViewEventsBlock:(viewEventsBlock)viewEventsBlock {
    objc_setAssociatedObject(self, @selector(viewEventsBlock), viewEventsBlock, OBJC_ASSOCIATION_COPY);
}

- (void)TT_viewWithViewManger:(id<EPViewProtocol>)viewManger {
    if (viewManger) {
        self.viewDelegate = viewManger;
    }
}
@end
