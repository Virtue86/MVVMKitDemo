//
//  EPMediator.h
//  tangtang
//
//  Created by Virtue on 2018/3/21.
//  Copyright © 2018年 pengTang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EPViewModelProtocol.h"
#import "EPViewManagerProtocol.h"



/**
 EPMediator 主要用于viewManager 和 viewModel之间的数据介质，一般情况下使用 它们之间的互相代理即可，二般情况下可以使用这个介质。
 */
@interface EPMediator : NSObject
/**
 *  viewModel
 */
@property (nonatomic, strong) NSObject<EPViewModelProtocol> *viewModel;

/**
 *  viewManger
 */
@property (nonatomic, strong) NSObject<EPViewManagerProtocol> *viewManger;

/**
 *  初始化
 */
- (instancetype)initWithViewModel:(id<EPViewModelProtocol>)viewModel viewManger:(id<EPViewManagerProtocol>)viewManger;

+ (instancetype)mediatorWithViewModel:(id<EPViewModelProtocol>)viewModel viewManger:(id<EPViewManagerProtocol>)viewManger;

/**
 *  将infos通知viewModel
 */
- (void)noticeViewModelWithInfos:(NSDictionary *)infos;

/**
 *  将infos通知viewMnager
 */
- (void)noticeViewMangerWithInfos:(NSDictionary *)infos;

@end
