//
//  TTFirstViewModel.h
//  MVVMKitDemo
//
//  Created by Virtue on 2018/3/22.
//

#import <Foundation/Foundation.h>
#import "EPViewProtocol.h"
#import "EPViewManagerProtocol.h"

@interface TTFirstViewModel : NSObject<EPViewProtocol, EPViewManagerProtocol>

- (void)handleWithTable:(UITableView *)table;

- (void)getDataWithModelArray:(NSArray *(^)(void))modelArrayBlock completion:(void (^)(void))completion;
@end
