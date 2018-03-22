

//
//  TTSecViewManager.m
//  MVVMKitDemo
//
//  Created by Virtue on 2018/3/22.
//

#import "TTSecViewManager.h"
#import "NSObject+TTProperties.h"
#import "TTFirstViewController.h"
#import "UIView+TTAdditions.h"

@implementation TTSecViewManager
#pragma mark ViewModel delegate

- (void)TT_viewModel:(id)viewModel withInfos:(NSDictionary *)infos {
    NSLog(@"infos %@ , viewModel %@", infos, viewModel);
    
    if (self.viewMangerDelegate && [self.viewMangerDelegate respondsToSelector:@selector(TT_viewManger:withInfos:)]) {
        [self.viewMangerDelegate TT_viewManger:self withInfos: @{@"info" : @"哈哈，你好ViewModel，我是viewManger，我把值给你"}];
    }
}

#pragma mark UIView的delegate方法
- (void)TT_view:(__kindof UIView *)view withEvents:(NSDictionary *)events {
    
    if ([[events allKeys] containsObject:@"jump"]) {
        TTFirstViewController *firstVC = [TTFirstViewController new];
        [view.sui_currentVC.navigationController pushViewController:firstVC animated:YES];
    }
}
#pragma mark ViewEvents Block
- (viewEventsBlock)TT_viewMangerWithViewEventBlockOfInfos:(NSDictionary *)infos {

    return ^(NSString *info) {
        if (self.viewMangerDelegate && [self.viewMangerDelegate respondsToSelector:@selector(TT_viewManger:withInfos:)]) {
            [self.viewMangerDelegate TT_viewManger:self withInfos: @{@"info" : @"哈哈，你好ViewModel，我是viewManger，我被点击了"}];
        }
    };
}
@end
