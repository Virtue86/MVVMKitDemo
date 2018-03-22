//
//  EPViewProtocol.h
//  tangtang
//
//  Created by Virtue on 2018/3/21.
//  Copyright © 2018年 pengTang. All rights reserved.
//


#import <UIKit/UIKit.h>


// *  包括以下的EPViewModelProtocol,EPViewManagerProtocol,EPViewProtocol 这三个协议在使用的过程中，
// *  在创建类的时候直接让其遵守对应的protocol。然后实现各自必要的代理方法，或者block实现。
// *  在控制器中实现三者的联合

 
@protocol EPViewProtocol <NSObject>

@optional

/**
 *  将view中的事件通过代理传递出去
 *
 *  @param view   view自己
 *  @param events 所触发事件的一些描述信息
 */
- (void)TT_view:(__kindof UIView *)view withEvents:(NSDictionary *)events;


@end

