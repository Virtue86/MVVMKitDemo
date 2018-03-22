//
//  EPViewModelProtocol.h
//  tangtang
//
//  Created by Virtue on 2018/3/21.
//  Copyright © 2018年 pengTang. All rights reserved.
//
#import <UIKit/UIKit.h>

/**
 *  请求成功block
 */
typedef void (^successBlock)(id responseObject);
/**
 *  请求失败block
 */
typedef void (^failureBlock) (NSError *error);
/**
 *  请求响应block
 */
typedef void (^responseBlock)(id dataObj, NSError *error);
/**
 *  监听进度响应block
 */
typedef void (^progressBlock)(NSProgress * progress);
/**
 *  将自己的信息返回给ViewManger的block
 */
typedef void (^viewManagerInfosBlock)(void);
/**
 *  将自己的信息返回给ViewModel的block
 */
typedef void (^viewModelInfosBlock)(void);

@protocol EPViewModelProtocol <NSObject>
@optional
//中介者传值 -- 主要是viewModel 和viewManager之间的数据传输
- (void)TT_notice;

/**
 *  返回指定viewModel的所引用的控制器
 */
- (void)TT_viewModelWithViewController:(UIViewController *)viewController;

/**
 *  加载数据
 */
- (void)TT_viewModelWithProgress:(progressBlock)progress success:(successBlock)success failure:(failureBlock)failure;

/**
 *  传递模型给view
 */
- (void)TT_viewModelWithModelBlcok:(void (^)(id model))modelBlock;

/**
 *  处理ViewMangerInfosBlock
 */
- (viewManagerInfosBlock)TT_viewModelWithViewMangerBlockOfInfos:(NSDictionary *)infos;

/**
 *  处理ViewModelInfosBlock
 */
- (viewModelInfosBlock)TT_viewModelWithOtherViewModelBlockOfInfos:(NSDictionary *)infos;

/**
 *  将viewModel中的信息通过代理传递给ViewManger
 *
 *  @param viewModel   viewModel自己
 *  @param infos 描述信息
 */
- (void)TT_viewModel:(id)viewModel withInfos:(NSDictionary *)infos;


@end
