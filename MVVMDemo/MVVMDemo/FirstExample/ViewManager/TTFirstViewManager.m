

//
//  TTFirstViewManager.m
//  MVVMKitDemo
//
//  Created by Virtue on 2018/3/22.
//

#import "TTFirstViewManager.h"
#import "NSObject+TTProperties.h"
#import "TTFirstInfo.h"
@implementation TTFirstViewManager
- (void)TT_viewModel:(id)viewModel withInfos:(NSDictionary *)infos {
    NSLog(@"infos %@", infos);
    
    TTFirstInfo *info = (TTFirstInfo *)infos[@"info"];
    
    info.text = @"不许吃鸡了";
    // 把值传给manager 处理数据之后传回viiewModel驱动view刷新显示

    if (self.viewMangerDelegate && [self.viewMangerDelegate respondsToSelector:@selector(TT_viewManger:withInfos:)]) {
        [self.viewMangerDelegate TT_viewManger:self withInfos: @{@"info" : info}];
    }
}

// 获得原始数据
- (void)TT_viewModelWithProgress:(progressBlock)progress success:(successBlock)success failure:(failureBlock)failure {
    NSMutableArray *infoArray = [[NSMutableArray alloc] init];
    if (success) {
        for (int i = 1; i < 80; i++) {
            TTFirstInfo *new = [TTFirstInfo new];
            new.text = [NSString stringWithFormat:@"还在吃鸡吗？%d", i];
            new.index = i;
            [infoArray addObject:new];
        }
        success(infoArray);
    }
}
@end
