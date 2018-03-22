//
//  TTFirstViewModel.m
//  MVVMKitDemo
//
//  Created by Virtue on 2018/3/22.
//

#import "TTFirstViewModel.h"
#import "TTCommonTableViewCell.h"
#import "NSObject+TTProperties.h"
#import "TTFirstInfo.h"

static NSString *const MyCellIdentifier = @"FirstCell" ;  // `cellIdentifier` AND `NibName` HAS TO BE SAME !

@interface TTFirstViewModel ()<UITableViewDelegate, UITableViewDataSource>{
    UITableView *_tableView;
}
@property (nonatomic, strong) NSMutableArray <TTFirstInfo *>*dataArrayList;
@end
@implementation TTFirstViewModel


- (NSArray *)dataArrayList {
    if (_dataArrayList == nil) {
        _dataArrayList = [NSMutableArray array];
    }
    return _dataArrayList;
}

//设置显示tableView
- (void)handleWithTable:(UITableView *)table {
    table.delegate = self;
    table.dataSource = self;
    [table registerNib:[UINib nibWithNibName:@"TTCommonTableViewCell" bundle:nil] forCellReuseIdentifier:MyCellIdentifier];
    _tableView = table;
}

//内部赋值
- (void)getDataWithModelArray:(NSArray *(^)(void))modelArrayBlock completion:(void (^)(void))completion {
    if (modelArrayBlock) {
        self.dataArrayList = modelArrayBlock().mutableCopy;
        if (completion) {
            completion();
        }
    }
}


- (TTFirstInfo *)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.dataArrayList[indexPath.row];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArrayList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TTFirstInfo *item = [self itemAtIndexPath:indexPath] ;
    
    TTCommonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyCellIdentifier forIndexPath:indexPath] ;
    
    cell.textLabel.text = item.text;
    return cell ;
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TTFirstInfo *item = [self itemAtIndexPath:indexPath] ;
    // 把值传给manager 处理数据
    if (self.viewModelDelegate && [self.viewModelDelegate respondsToSelector:@selector(TT_viewModel:withInfos:)]) {
        [self.viewModelDelegate TT_viewModel:self withInfos:@{@"info" : item}];
    }
}

#pragma mark ViewManger delegate
- (void)TT_viewManger:(id)viewManger withInfos:(NSDictionary *)infos {
    
//    viewManager 处理之后的数据传回 viewModel 驱动view改变
    TTFirstInfo *info = (TTFirstInfo *)infos[@"info"];
    
    [self.dataArrayList enumerateObjectsUsingBlock:^(TTFirstInfo * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.index == info.index) {
            [self.dataArrayList replaceObjectAtIndex:idx withObject:info];
        }
    }];
    
    [_tableView reloadData];
    
}

-(void)dealloc {
}
@end
