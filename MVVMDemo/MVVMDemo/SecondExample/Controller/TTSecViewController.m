//
//  TTSecViewController.m
//  MVVMKitDemo
//
//  Created by Virtue on 2018/3/22.
//

#import "TTSecViewController.h"
#import "TTCommmonView.h"
#import "TTSecViewModel.h"
#import "TTSecViewManager.h"
#import "NSObject+TTProperties.h"
#import "UIView+TTAdditions.h"
#import "UIView+TTConfigure.h"
#import "UIView+TTEvents.h"


@interface TTSecViewController () {
    TTSecViewModel *_secViewModel;
    TTSecViewManager *_secViewManager;
      UIButton *_changeActionBtn;
      int _count;
}
@property (nonatomic, strong) TTCommmonView *commonView;
@end

@implementation TTSecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _secViewModel = [TTSecViewModel new];
    _secViewManager = [TTSecViewManager new];
    
    // viewManger ----> info <-----  viewModel 之间通过代理方式交互
    _secViewModel.viewModelDelegate = _secViewManager;
    _secViewManager.viewMangerDelegate = _secViewModel;
    
    self.commonView.viewDelegate = _secViewManager;
    [self.view addSubview:self.commonView];
    
    
    _changeActionBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, CGRectGetMaxY(self.commonView.frame) + 10, 150, 30)];
    _changeActionBtn.backgroundColor = [UIColor redColor];
    [_changeActionBtn addTarget:self action:@selector(changeAction:) forControlEvents:UIControlEventTouchUpInside];
    [_changeActionBtn setTitle:@"点击改变数据" forState:0];
    
    [self.view addSubview:_changeActionBtn];
}

- (void)changeAction:(UIButton *)sender {
    _count++;
    [self.commonView TT_configureViewWithViewModel:_secViewModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (TTCommmonView *)commonView {
    if (!_commonView) {
        _commonView = [[TTCommmonView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    }
    return _commonView;
}
@end
