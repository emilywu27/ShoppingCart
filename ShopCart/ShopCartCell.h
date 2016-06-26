//
//  ShopCartCell.h
//  ShopCart
//
//  Created by mac on 16/6/20.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsInfoModel.h"

//添加代理，用于按钮加减的实现
@protocol ShopCartCellDelegate <NSObject>
-(void)btnClick:(UITableViewCell *)cell andFlag:(int)flag;
@end
@interface ShopCartCell : UITableViewCell
//增加一个view
@property (nonatomic,strong) UIView *mainView;
@property (nonatomic,strong) UIButton *selectBtn;
@property (nonatomic,strong) UIImageView *goodsImg;
@property (nonatomic,strong) UILabel *introductionLab;
@property (nonatomic,strong) UILabel *needLab;
@property (nonatomic,strong) UILabel *needNumLab;
@property (nonatomic,strong) UILabel *remainedLab;
@property (nonatomic,strong) UILabel *remianedNumLab;
@property (nonatomic,strong) UIButton *addBtn;
@property (nonatomic,strong) UITextField *goodsNumTF;
@property (nonatomic,strong) UIButton *minusBtn;
@property (nonatomic,strong) UILabel *winLab;
@property (nonatomic,strong) UILabel *winNumLab;
@property(assign,nonatomic)BOOL selectState;//选中状态
//赋值
-(void)addTheValue:(GoodsInfoModel *)goodsModel;
@property(assign,nonatomic)id<ShopCartCellDelegate>delegate;
@end
