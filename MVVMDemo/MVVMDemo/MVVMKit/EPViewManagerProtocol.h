//
//  EPViewManagerProtocol.h
//  tangtang
//
//  Created by Virtue on 2018/3/21.
//  Copyright © 2018年 pengTang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef void (^viewEventsBlock)(NSString *info);

/**
 *  将自己的信息返回给ViewModel的block
 */
typedef void (^viewModelInfosBlock)( void);

/**
 *  将自己的信息返回给ViewManger的block
 */
typedef void (^viewMangerInfosBlock)(void );


@protocol EPViewManagerProtocol <NSObject>
@optional

//中介者传值 -- 主要是viewModel 和viewManager之间的数据传输
- (void)TT_notice;

/**
 *  设置Controller的子视图的管理者为self
 *
 *  @param superView 一般指subView所在控制器的view
 */
- (void)TT_viewMangerWithSuperView:(UIView *)superView;

/**
 *  设置subView的管理者为self
 *
 *  @param subView 管理的subView
 */
- (void)TT_viewMangerWithSubView:(UIView *)subView;

/**
 *  设置添加subView的事件
 *
 *  @param  subView
 *  @param info 附带信息，用于区分调用
 */
- (void)TT_viewMangerWithHandleOfSubView:(UIView *)subView info:(NSString *)info;

/**
 *  返回viewManger所管理的视图
 *
 *  @return viewManger所管理的视图
 */
- (__kindof UIView *)TT_viewMangerOfSubView;

/**
 *  得到其它viewManger所管理的subView，用于自己内部
 *
 *  @param  info 附带信息，用于区分调用
 */
- (void)TT_viewMangerWithOtherSubViews:(NSDictionary *)viewInfos;

/**
 *  需要重新布局subView时，更改subView的frame或者约束
 *
 *  @param block 更新布局完成的block
 */
- (void)TT_viewMangerWithLayoutSubViews:(void (^)(void ))updateBlock;

/**
 *  使子视图更新到最新的布局约束或者frame
 */
- (void)TT_viewMangerWithUpdateLayoutSubViews;

/**
 *  将model数据传递给viewManger
 */
- (void)TT_viewMangerWithModel:(NSDictionary * (^) (void ))dictBlock;

/**
 *  处理viewBlock事件
 */
- (viewEventsBlock)TT_viewMangerWithViewEventBlockOfInfos:(NSDictionary *)infos;

/**
 *  处理ViewModelInfosBlock
 */
- (viewModelInfosBlock)TT_viewMangerWithViewModelBlockOfInfos:(NSDictionary *)infos;

/**
 *  处理ViewMangerInfosBlock
 */
- (viewMangerInfosBlock)TT_viewMangerWithOtherViewMangerBlockOfInfos:(NSDictionary *)infos;

/**
 *  将viewManger中的信息通过代理传递给ViewModel
 *
 *  @param viewManger   viewManger自己
 *  @param infos 描述信息
 */
- (void)TT_viewManger:(id)viewManger withInfos:(NSDictionary *)infos;

@end
