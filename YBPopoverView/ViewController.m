//
//  ViewController.m
//  YBPopoverView
//
//  Created by 氧车乐 on 2019/6/7.
//  Copyright © 2019 YCL. All rights reserved.
//

#import "ViewController.h"
#import "YBPopoverView.h"
@interface ViewController ()
@property(nonatomic,retain)YBPopoverView * popView;
@property(nonatomic,strong)UIButton * chooseBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _chooseBtn = [[UIButton alloc]initWithFrame:CGRectMake(200, 200, 100, 100)];
    _chooseBtn.backgroundColor = [UIColor redColor];
    _chooseBtn.userInteractionEnabled = YES;
    [_chooseBtn setTitle:@"选择" forState:UIControlStateNormal];
    [_chooseBtn addTarget:self action:@selector(chooseBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_chooseBtn];
    [self.view addSubview:self.popView];
}

-(void)show{
    _popView.tableDataSource = @[@"aaaaa",@"bbbbb",@"cccccc"];
    [_popView reloadData];
}

-(YBPopoverView *)popView{
    if (!_popView) {
        __weak __typeof__(self) weakSelf = self;
        _popView = [[YBPopoverView alloc]initWithFrame:CGRectMake(KUIScreenWidth, 0, KUIScreenWidth, KUIScreenHeight)];
        _popView.tableDataSource = @[@"1111111",@"2222222",@"1111111",@"2222222",@"1111111",@"2222222",@"1111111",@"2222222",@"1111111",@"2222222",@"1111111",@"2222222",@"1111111",@"2222222",@"1111111",@"2222222",@"1111111",@"2222222",@"1111111",@"2222222",@"1111111",@"2222222",@"1111111",@"2222222",@"1111111",@"2222222",@"1111111",@"2222222",@"1111111",@"2222222",@"1111111",@"2222222",@"1111111",@"2222222"];
        _popView.didSelectRowBlock = ^(NSInteger indexRow) {
            NSLog(@"点击了第%lu 个",indexRow);
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"标题" message:[NSString stringWithFormat:@"你选择了第%lu行",indexRow] preferredStyle:UIAlertControllerStyleAlert];
            
            [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                NSLog(@"点击确认");
                
            }]];
            [weakSelf presentViewController:alertController animated:YES completion:nil];
            
        };
    }
    return _popView;
}

-(void)chooseBtnAction{
    [UIView animateWithDuration:0.2 animations:^{
        self->_popView.frame = CGRectMake(0, 0, KUIScreenWidth, KUIScreenHeight);
    }];
}

@end
