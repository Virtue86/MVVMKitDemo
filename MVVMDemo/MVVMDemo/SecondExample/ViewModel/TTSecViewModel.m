//
//  TTSecViewModel.m
//  MVVMKitDemo
//
//  Created by Virtue on 2018/3/22.
//

#import "TTSecViewModel.h"
#import "NSObject+TTProperties.h"
#import "TTSecInfo.h"

@implementation TTSecViewModel{
    int _count;
}
#pragma mark ViewManger delegate
- (void)TT_viewManger:(id)viewManger withInfos:(NSDictionary *)infos  {
    NSLog(@"%@",infos);
    
}

#pragma mark ViewManger Block
- (viewMangerInfosBlock)TT_viewModelWithViewMangerBlockOfInfos:(NSDictionary *)infos {
    return ^{
        NSLog(@"hello");
    };
}

- (void)TT_viewModelWithModelBlcok:(void (^)(id model))modelBlock {
    if (modelBlock) {
        _count++;
        
        TTSecInfo *newInfo =  [TTSecInfo new];
        newInfo.infoStr = [NSString stringWithFormat:@"吃鸡%d次", _count];
        modelBlock(newInfo);
    }
}
@end
