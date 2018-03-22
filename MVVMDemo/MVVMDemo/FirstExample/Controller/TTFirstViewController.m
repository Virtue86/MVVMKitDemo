//
//  TTFirstViewController.m
//  MVVMKitDemo
//
//  Created by Virtue on 2018/3/22.
//

#import "TTFirstViewController.h"
#import "TTFirstViewModel.h"
#import "TTFirstViewManager.h"
#import "NSObject+TTProperties.h"

@interface TTFirstViewController (){
    TTFirstViewModel *_firstViewModel;
    TTFirstViewManager *_firstViewManager;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TTFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _firstViewModel = [TTFirstViewModel new];
    _firstViewManager = [TTFirstViewManager new];

    
    // viewManger ----> info <-----  viewModel 之间通过代理方式交互
    _firstViewModel.viewModelDelegate = _firstViewManager;
    _firstViewManager.viewMangerDelegate = _firstViewModel;
    
    [self setUpTableView];
}

- (void)setUpTableView {
    [_firstViewModel handleWithTable:self.tableView];
    
    typeof(self) __weak weakSelf = self;
    [_firstViewManager TT_viewModelWithProgress:nil success:^(id responseObject) {
        [_firstViewModel getDataWithModelArray:^NSArray *{
            return responseObject;
        } completion:^{
            [weakSelf.tableView reloadData];
        }];
    } failure:^(NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
