//
//  YBPopoverView.m
//  YBPopoverView
//
//  Created by 氧车乐 on 2019/6/7.
//  Copyright © 2019 YCL. All rights reserved.
//

#import "YBPopoverView.h"

@implementation YBPopoverView{
    NSArray * tableArr;
    CGRect myFrame;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        myFrame = frame;
        [self setup];
    }
    return self;
}


- (void)setup{
    _bgView = [UIView new];
    _bgView.backgroundColor = [UIColor clearColor];
    [self addSubview:_bgView];
    
    _leftView = [UIView new];
    _leftView.userInteractionEnabled = YES;
    _leftView.backgroundColor =[[UIColor blackColor]colorWithAlphaComponent:0.2];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    _bgView.userInteractionEnabled = YES;
    [_leftView addGestureRecognizer:tap];
    [_bgView addSubview:_leftView];
    
    
    
    _mainView = [UIView new];
    _mainView.backgroundColor = [UIColor whiteColor];
    [_bgView addSubview:_mainView];
    
    
    _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVHTOP, kScreenWidth * 0.5, kScreenHeight - NAVHTOP - TABBARDIBU) style:UITableViewStylePlain];
    _mainTableView.backgroundColor = [UIColor whiteColor];
    _mainTableView.separatorColor  = [UIColor lightGrayColor];
    _mainTableView.dataSource = self;
    _mainTableView.delegate = self;
    _mainTableView.showsHorizontalScrollIndicator = NO;
    _mainTableView.tableHeaderView = [UIView new];
    _mainTableView.tableFooterView = [UIView new];
    _mainTableView.estimatedSectionFooterHeight = 0;
    _mainTableView.estimatedSectionHeaderHeight = 0;
    _mainTableView.estimatedRowHeight = 0;
    [_mainView addSubview:_mainTableView];
}

//隐藏
-(void)dissMissView{
    [UIView animateWithDuration:0.2 animations:^{
        self.frame = self->myFrame;
    }];
}

-(void)tapAction:(UITapGestureRecognizer *)tap{
    [self dissMissView];
}

-(void)reloadData{
    [_mainTableView reloadData];
}

-(void)tapAction2:(UITapGestureRecognizer *)tap{
    NSLog(@"11");
}


-(void)updateConstraints{
    
    _bgView.frame = self.bounds;
    _leftView.frame = CGRectMake(0, 0, kScreenWidth * 0.5, kScreenHeight);
    _mainView.frame = CGRectMake(kScreenWidth * 0.5, 0, kScreenWidth * 0.5, kScreenHeight);
    
    NSLog(@"111");
    
    [super updateConstraints];
}

-(void)setTableDataSource:(NSArray *)tableDataSource{
    _tableDataSource = tableDataSource;
    NSLog(@"tableDataSource = %@",tableDataSource);
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(18, 10,109,25)];
    label.text = @"选择运输路线";
    label.textColor = [UIColor colorWithRed:77/255.0 green:84/255.0 blue:109/255.0 alpha:1.0];
    label.font = [UIFont fontWithName:@"PingFangSC-Medium" size: 18];
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth/2, 40)];
    view.backgroundColor = [UIColor whiteColor];
    [view addSubview:label];
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UITableViewHeaderFooterView alloc]init];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 46;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _tableDataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = _tableDataSource[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.didSelectRowBlock) {
        self.didSelectRowBlock(indexPath.row);
        [self dissMissView];
    }
}


- (void)didMoveToSuperview{
    [self setNeedsUpdateConstraints];
}



@end
