//
//  YBPopoverView.h
//  YBPopoverView
//
//  Created by 氧车乐 on 2019/6/7.
//  Copyright © 2019 YCL. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kScreenWidth    CGRectGetMaxX([[UIScreen mainScreen] bounds])
#define kScreenHeight   CGRectGetMaxY([[UIScreen mainScreen] bounds])

#define KUIScreenWidth [UIScreen mainScreen].bounds.size.width
#define KUIScreenHeight [UIScreen mainScreen].bounds.size.height
#define kWidthRate  (MAX(KUIScreenWidth, KUIScreenHeight)  == 812 ? 1:KUIScreenWidth/375 )
#define kHeightRate (MAX(KUIScreenWidth, KUIScreenHeight)  == 812 ? 1:KUIScreenHeight/667)
#define NAVHTOP (MAX(KUIScreenWidth, KUIScreenHeight)  == 812 ? 44 : 20)
#define TABBARDIBU (MAX(KUIScreenWidth, KUIScreenHeight)  == 812 ? 34 : 0)
#define NAVH (MAX(KUIScreenWidth, KUIScreenHeight)  == 812 ? (44+44*kHeightRate) : 20+44*kHeightRate)
#define TABBARH (MAX(KUIScreenWidth, KUIScreenHeight)  == 812 ? 83 : 49)


typedef NS_ENUM(NSInteger, PopAnimationStyle) {
    LeftPopAnimationStyle = 0,    // 左侧弹出
    rightPopAnimationStyle = 1,    // 右侧弹出
    topPopAnimationStyle = 2,    // 上面弹出
    bottomPopAnimationStyle = 2,    // 下面弹出
};

NS_ASSUME_NONNULL_BEGIN

@interface YBPopoverView : UIView<UITableViewDelegate,UITableViewDataSource>

//弹出比例 默认0.4
@property(nonatomic,assign)CGFloat popScale;

@property(nonatomic,retain)UIView * bgView;

//幕布
@property(nonatomic,retain)UIView * leftView;

//显示的view
@property(nonatomic,retain)UIView * mainView;

@property(nonatomic,retain)UITableView *mainTableView;
@property(nonatomic,strong)NSArray * tableDataSource;

//显示
-(void)showView;

//隐藏
-(void)dissMissView;

//刷新t
-(void)reloadData;

@property(nonatomic,strong)void (^didSelectRowBlock)(NSInteger indexRow);
@end

NS_ASSUME_NONNULL_END
