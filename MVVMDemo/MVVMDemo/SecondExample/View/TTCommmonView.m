//
//  TTCommmonView.m
//  MVVMKitDemo
//
//  Created by Virtue on 2018/3/22.
//

#import "TTCommmonView.h"
#import "UIView+TTEvents.h"
#import "UIView+TTConfigure.h"
#import "TTSecInfo.h"

@interface TTCommmonView()
{
    UIButton *_pushActionBtn;
  
    UILabel *_textLable;
  
}
@end

@implementation TTCommmonView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _pushActionBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 100, 20)];
        _pushActionBtn.backgroundColor = [UIColor blueColor];
        [_pushActionBtn addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchUpInside];
        [_pushActionBtn setTitle:@"点击push" forState:0];
        
        [self addSubview:_pushActionBtn];
                
        _textLable = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_pushActionBtn.frame) + 30, 100, 20)];
        _textLable.textColor = [UIColor redColor];
        
        [self addSubview:_textLable];
    }
    return self;
}

- (void)pushAction:(UIButton *)sender {
    if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(TT_view:withEvents:)]) {
        [self.viewDelegate TT_view:self withEvents:@{@"jump" : @"vc"}];
    }
}

- (void)TT_configureViewWithModel:(id)model {
    
}

- (void)TT_configureViewWithViewModel:(id<EPViewModelProtocol>)viewModel {
    
    [viewModel TT_viewModelWithModelBlcok:^(id model) {
        TTSecInfo *secInfo = (TTSecInfo *)model;
       // viewmodel 处理数据，来驱动view进行变化
        _textLable.text = secInfo.infoStr;
    }];
}
@end
