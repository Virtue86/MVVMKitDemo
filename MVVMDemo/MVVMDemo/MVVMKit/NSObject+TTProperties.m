//
//  NSObject+TTProperties.m
//  tangtang
//
//  Created by Virtue on 2018/3/21.
//  Copyright © 2018年 pengTang. All rights reserved.
//

#import "NSObject+TTProperties.h"
#import <objc/runtime.h>


@implementation NSObject (TTProperties)
- (id<EPViewModelProtocol>)viewModelDelegate {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setViewModelDelegate:(id<EPViewModelProtocol>)viewModelDelegate {
    objc_setAssociatedObject(self, @selector(viewModelDelegate), viewModelDelegate, OBJC_ASSOCIATION_ASSIGN);
}

- (id<EPViewManagerProtocol>)viewMangerDelegate {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setViewMangerDelegate:(id<EPViewManagerProtocol>)viewMangerDelegate {
    objc_setAssociatedObject(self, @selector(viewMangerDelegate), viewMangerDelegate, OBJC_ASSOCIATION_ASSIGN);
}

- (viewMangerInfosBlock)viewMangerInfosBlock {
    return objc_getAssociatedObject(self, @selector(viewMangerInfosBlock));
}

- (void)setViewMangerInfosBlock:(viewMangerInfosBlock)viewMangerInfosBlock {
    objc_setAssociatedObject(self, @selector(viewMangerInfosBlock), viewMangerInfosBlock, OBJC_ASSOCIATION_COPY);
}

- (viewModelInfosBlock)viewModelInfosBlock {
    return objc_getAssociatedObject(self, @selector(viewModelInfosBlock));
}

- (void)setViewModelInfosBlock:(viewModelInfosBlock)viewModelInfosBlock {
    objc_setAssociatedObject(self, @selector(viewModelInfosBlock), viewModelInfosBlock, OBJC_ASSOCIATION_COPY);
}

- (viewModelBlock)viewModelBlock {
    return objc_getAssociatedObject(self, @selector(viewModelBlock));
}

- (void)setViewModelBlock:(viewModelBlock)viewModelBlock {
    objc_setAssociatedObject(self, @selector(viewModelBlock), viewModelBlock, OBJC_ASSOCIATION_COPY);
}

/**
 *  mediator
 */
- (void)setTT_mediator:(EPMediator *)TT_mediator {
    objc_setAssociatedObject(self, @selector(TT_mediator), TT_mediator, OBJC_ASSOCIATION_RETAIN);
}
- (EPMediator *)TT_mediator {
    return objc_getAssociatedObject(self, @selector(TT_mediator));
}

/**
 * TT_viewMangerInfos
 */
- (void)setTT_viewMangerInfos:(NSDictionary *)TT_viewMangerInfos {
    objc_setAssociatedObject(self, @selector(TT_viewMangerInfos), TT_viewMangerInfos, OBJC_ASSOCIATION_COPY);
}
- (NSDictionary *)TT_viewMangerInfos {
    return objc_getAssociatedObject(self, @selector(TT_viewMangerInfos));
}

/**
 *  TT_viewModelInfos
 */
- (void)setTT_viewModelInfos:(NSDictionary *)TT_viewModelInfos {
    objc_setAssociatedObject(self, @selector(TT_viewModelInfos), TT_viewModelInfos, OBJC_ASSOCIATION_COPY);
}
- (NSDictionary *)TT_viewModelInfos {
    return objc_getAssociatedObject(self, @selector(TT_viewModelInfos));
}

- (nullable NSDictionary *)TT_allProperties
{
    unsigned int count = 0;
    
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableDictionary *resultDict = [@{} mutableCopy];
    
    for (NSUInteger i = 0; i < count; i ++) {
        
        const char *propertyName = property_getName(properties[i]);
        NSString *name = [NSString stringWithUTF8String:propertyName];
        id propertyValue = [self valueForKey:name];
        
        if (propertyValue) {
            resultDict[name] = propertyValue;
        } else {
            resultDict[name] = @"字典的key对应的value不能为nil";
        }
    }
    
    free(properties);
    
    return resultDict;
}
@end
