//
//  EPMediator.m
//  tangtang
//
//  Created by Virtue on 2018/3/21.
//  Copyright © 2018年 pengTang. All rights reserved.
//

#import "EPMediator.h"
#import "NSObject+TTProperties.h"

@implementation EPMediator
- (instancetype)initWithViewModel:(id<EPViewModelProtocol>)viewModel viewManger:(id<EPViewManagerProtocol>)viewManger {
    if (self = [super init]) {
        self.viewModel = (NSObject<EPViewModelProtocol> *)viewModel;
        self.viewManger = (NSObject<EPViewManagerProtocol> *)viewManger;
    }
    return self;
}

+ (instancetype)mediatorWithViewModel:(id<EPViewModelProtocol>)viewModel viewManger:(id<EPViewManagerProtocol>)viewManger {
    return [[self alloc]initWithViewModel:viewModel viewManger:viewManger];
}

- (void)noticeViewModelWithInfos:(NSDictionary *)infos {
    self.viewModel.TT_viewModelInfos = infos;
}

- (void)noticeViewMangerWithInfos:(NSDictionary *)infos {
    self.viewManger.TT_viewMangerInfos= infos;
}

@end
