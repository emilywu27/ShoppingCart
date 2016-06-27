//
//  SettlementView.m
//  ShoppingCart
//
//  Created by mac on 16/6/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SettlementView.h"
#import "SC.pch"
@implementation SettlementView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self){
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    self.backgroundColor=[UIColor whiteColor];
    self.layer.borderColor = [UIColor grayColor].CGColor;
    self.layer.borderWidth = 0.5;
    //全选按钮
    //self.allSelecteBtn
    UIButton *allSelecteBtn=[[UIButton alloc]init];
    [self addSubview:allSelecteBtn];
    [allSelecteBtn addTarget:self action:@selector(selectBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    _allSelecteBtn=allSelecteBtn;
    
    [self.allSelecteBtn setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
//    [self.allSelecteBtn setImage:[UIImage imageNamed:@"5"] forState:UIControlStateSelected];

    self.allSelecteLab=[[UILabel alloc]init];
    [self addSubview:self.allSelecteLab];
    self.allSelecteLab.text=@"全选";
    self.allSelecteLab.font=[UIFont systemFontOfSize:14.0];
    
    self.sumLab=[[UILabel alloc]init];
    [self addSubview:self.sumLab];
    self.sumLab.text=@"0　元";
    self.sumLab.textColor=[UIColor redColor];
    self.allSelecteLab.font=[UIFont systemFontOfSize:16.0];
    
    self.goodsNumLab=[[UILabel alloc]init];
    [self addSubview:self.goodsNumLab];
    self.goodsNumLab.text=@"共计：0　件商品";
    self.goodsNumLab.font=[UIFont systemFontOfSize:12.0];
    
    //全选按钮
    self.statementBtn=[[UIButton alloc]init];
    [self addSubview:self.statementBtn];
    [self.statementBtn setBackgroundColor:[UIColor redColor]];
    [self.statementBtn setTitle:@"结算" forState:UIControlStateNormal];    
}
-(void)selectBtnAction:(UIButton *)sender{
    
    //[self.delegate btnClick:self andFlag:(int)sender.tag];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    WEAKSELF(weakSelf);
    [self.allSelecteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.mas_centerY).offset(0);
        make.left.mas_equalTo(weakSelf).offset(10);
        make.height.mas_equalTo(17);
        make.width.mas_equalTo(17);
    }];

    [self.allSelecteLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.mas_centerY).offset(0);
        make.left.mas_equalTo(weakSelf.allSelecteBtn.mas_right).offset(5);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    [self.sumLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.left.mas_equalTo(weakSelf.allSelecteLab.mas_right).offset(20);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(100);
    }];
    [self.goodsNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.sumLab.mas_bottom).offset(5);
        make.left.mas_equalTo(weakSelf.sumLab);
        make.height.mas_equalTo(weakSelf.sumLab);
        make.width.mas_equalTo(weakSelf.sumLab);
    }];
    [self.statementBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.mas_centerY).offset(0);
        make.right.mas_equalTo(weakSelf.mas_right).offset(-5);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(100);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
