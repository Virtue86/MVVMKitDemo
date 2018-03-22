//
//  NSObject+TTProperties.h
//  tangtang
//
//  Created by Virtue on 2018/3/21.
//  Copyright © 2018年 pengTang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EPViewModelProtocol.h"
#import "EPViewManagerProtocol.h"
#import "EPViewProtocol.h"
#import "EPMediator.h"



/**
 viewManager 和 viewModel之间的代理，介质传输

 */
NS_ASSUME_NONNULL_BEGIN

/**
 *  ViewModelBlock
 */
typedef _Nonnull id (^viewModelBlock)(void );
/**
 *  ViewMangerInfosBlock
 */
typedef void (^viewMangerInfosBlock)( void);
/**
 *  ViewModelInfosBlock
 */
typedef void (^viewModelInfosBlock)( void);



@interface NSObject (TTProperties)
/**
 *  viewModelBlock
 */
@property (nonatomic, copy, nonnull) viewModelBlock viewModelBlock;

/**
 *  获取一个对象的所有属性
 */
- (nullable NSDictionary *)TT_allProperties;

/**
 *  viewMangerDelegate
 */
@property (nullable, nonatomic, weak)id<EPViewManagerProtocol> viewMangerDelegate;

/**
 *  ViewMangerInfosBlock
 */
@property (nonatomic, copy) viewMangerInfosBlock viewMangerInfosBlock;

/**
 *  viewModelDelegate
 */
@property (nullable, nonatomic, weak) id<EPViewModelProtocol> viewModelDelegate;

/**
 *  ViewModelInfosBlock
 */
@property (nonatomic, copy) viewModelInfosBlock viewModelInfosBlock;

/**
 *  mediator -- viewModel跟viewManager之间的中间值
 */
@property (nonatomic, strong) EPMediator *TT_mediator;

/**
 *  TT_viewMangerInfos
 */
@property (nonatomic, copy) NSDictionary *TT_viewMangerInfos;

/**
 *  TT_viewModelInfos
 */
@property (nonatomic, copy) NSDictionary *TT_viewModelInfos;
@end
NS_ASSUME_NONNULL_END
