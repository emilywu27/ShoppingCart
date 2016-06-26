//
//  SettlementView.h
//  ShoppingCart
//
//  Created by mac on 16/6/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettlementView : UIView
@property(nonatomic,strong)UIButton*allSelecteBtn;
@property(nonatomic,strong)UILabel*allSelecteLab;//全选
@property(nonatomic,strong)UILabel*sumLab;//总价
@property(nonatomic,strong)UILabel*goodsNumLab;//商品数
@property(nonatomic,strong)UIButton *statementBtn;//结算
@end
