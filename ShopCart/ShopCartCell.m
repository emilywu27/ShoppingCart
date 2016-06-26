//
//  ShopCartCell.m
//  ShopCart
//
//  Created by mac on 16/6/20.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShopCartCell.h"
#import "SC.pch"
@interface ShopCartCell()

@end
@implementation ShopCartCell

- (void)awakeFromNib {
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.layer.borderColor = [UIColor redColor].CGColor;
//        self.layer.borderWidth = 1;
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
//        self.backgroundColor=[UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:0.5];
//        [self setSeparatorInset:UIEdgeInsetsMake(0, 60, 0, 0)];
        UIView *mainView=[[UIView alloc]init];
        [self.contentView addSubview:mainView];
        mainView.backgroundColor=[UIColor whiteColor];
        self.mainView=mainView;
        
        UIButton *selectBtn = [[UIButton alloc]init];
        [self.mainView addSubview:selectBtn];
        [selectBtn setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
        [selectBtn setImage:[UIImage imageNamed:@"5"]forState:UIControlStateSelected];
        [selectBtn addTarget:self action:@selector(selectBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        selectBtn.tag=13;
        self.selectBtn=selectBtn;

        
        UIImageView *goodsImg = [[UIImageView alloc]init];
        [self.mainView addSubview:goodsImg];
//        goodsImg.image = [UIImage imageNamed:@"4"];
        self.goodsImg=goodsImg;
        
        UILabel *introductionLab = [[UILabel alloc]init];
        [introductionLab setFont:[UIFont systemFontOfSize:17.0]];
        [self.mainView addSubview:introductionLab];
//        introductionLab.text=@"[111111111]";
        introductionLab.textColor=[UIColor grayColor];
        self.introductionLab=introductionLab;
        
        UILabel *needLab = [[UILabel alloc]init];
        [needLab setFont:[UIFont systemFontOfSize:13.0]];
        [self.mainView addSubview:needLab];
        needLab.text=@"总需:";
        needLab.textColor=[UIColor grayColor];
        self.needLab=needLab;
        
        
        UILabel *needNumLab = [[UILabel alloc]init];
        [needNumLab setFont:[UIFont systemFontOfSize:13.0]];
        [self.mainView addSubview:needNumLab];
//        needNumLab.text=@"1000";
        needNumLab.textColor=[UIColor grayColor];
        self.needNumLab=needNumLab;
        
        
        UILabel *remainedLab = [[UILabel alloc]init];
        [remainedLab setFont:[UIFont systemFontOfSize:13.0]];
        [self.mainView addSubview:remainedLab];
        remainedLab.textColor=[UIColor grayColor];
        remainedLab.text=@"剩余:";
        self.remainedLab=remainedLab;
        
        UILabel *remianedNumLab = [[UILabel alloc]init];
        [remianedNumLab setFont:[UIFont systemFontOfSize:13.0]];
        [self.mainView addSubview:remianedNumLab];
//        remianedNumLab.text=@"999";
        remianedNumLab.textColor=[UIColor redColor];
        self.remianedNumLab=remianedNumLab;
        
        
        UIButton *minusBtn = [[UIButton alloc]init];
        [self.mainView addSubview:minusBtn];
        [minusBtn setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
        [minusBtn addTarget:self action:@selector(deleteBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        minusBtn.tag = 11;
        self.minusBtn=minusBtn;
        
        UITextField *goodsNumTF = [[UITextField alloc]init];
        [self.mainView addSubview:goodsNumTF];
        goodsNumTF.textAlignment=NSTextAlignmentCenter;
//        goodsNumTF.text=@"10";
        goodsNumTF.backgroundColor=[UIColor grayColor];
        self.goodsNumTF=goodsNumTF;
        
        UIButton *addBtn = [[UIButton alloc]init];
        [self.mainView addSubview:addBtn];
        [addBtn setImage:[UIImage imageNamed:@"3"] forState:UIControlStateNormal];
        [addBtn addTarget:self action:@selector(addBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        addBtn.tag = 12;
        self.addBtn=addBtn;

        
        UILabel *winLab = [[UILabel alloc]init];
        [winLab setFont:[UIFont systemFontOfSize:14.0]];
        [self.mainView addSubview:winLab];
        winLab.text=@"中奖概率";
        winLab.textColor=[UIColor grayColor];
        self.winLab=winLab;
        
        UILabel *winNumLab = [[UILabel alloc]init];
        [winNumLab setFont:[UIFont systemFontOfSize:14.0]];
        [self.mainView addSubview:winNumLab];
        winNumLab.text=@"100％";
        winNumLab.textColor=[UIColor grayColor];
        self.winNumLab=winNumLab;
        
    }
    return self;
}
/**
 
 *  给单元格赋值
 
 *
 
 *  @param goodsModel 里面存放各个控件需要的数值
 
 */

-(void)addTheValue:(GoodsInfoModel *)goodsModel
{
    self.goodsImg.image = [UIImage imageNamed:goodsModel.imageName];
    self.introductionLab.text = goodsModel.goodsTitle;
    self.needNumLab.text = [NSString stringWithFormat:@"%ld",(long)goodsModel.allNum];
    self.remianedNumLab.text = [NSString stringWithFormat:@"%ld",(long)goodsModel.remainedNum];
    self.goodsNumTF.text=[NSString stringWithFormat:@"%ld",(long)goodsModel.goodsNum];

    if (goodsModel.selectState){
        self.selectState = YES;
        [self.selectBtn setImage:[UIImage imageNamed:@"5"] forState:UIControlStateNormal];
    }else{
        
         self.selectState = NO;
        [self.selectBtn setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    }
}
//
-(void)selectBtnAction:(UIButton *)sender{

    [self.delegate btnClick:self andFlag:(int)sender.tag];
}
//
-(void)deleteBtnAction:(UIButton *)sender{
//    NSInteger goodsNum=[self.goodsNumTF.text integerValue];
//    if (goodsNum>1) {
//        goodsNum-=1;
//        self.goodsNumTF.text=[NSString stringWithFormat:@"%ld",(long)goodsNum];
//        NSInteger remianedNum=[self.remianedNumLab.text integerValue]+1;
//        self.remianedNumLab.text=[NSString stringWithFormat:@"%ld",(long)remianedNum];
//    }
    ////////
    //判断是否选中，选中才能点击
    if (self.selectState == YES)
    {
        //调用代理
        [self.delegate btnClick:self andFlag:(int)sender.tag];
    }
}

-(void)addBtnAction:(UIButton *)sender{
//    NSInteger goodsNum=[self.goodsNumTF.text integerValue];
//    if ([self.remianedNumLab.text integerValue]>0) {
//        goodsNum+=1;
//        self.goodsNumTF.text=[NSString stringWithFormat:@"%ld",(long)goodsNum];
//        NSInteger remianedNum=[self.remianedNumLab.text integerValue]-1;
//        self.remianedNumLab.text=[NSString stringWithFormat:@"%ld",(long)remianedNum];
//    }
    ///////
    if (self.selectState == YES)
    {
        //调用代理
        [self.delegate btnClick:self andFlag:(int)sender.tag];
    }
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    WEAKSELF(weakSelf);
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.mas_equalTo(weakSelf).offset(0);
        make.left.and.right.mas_equalTo(0);
        make.top.and.bottom.mas_equalTo(weakSelf).offset(10);
    }];
    [self.selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.mainView.mas_centerY).offset(0);
        make.left.mas_equalTo(10);
        //make.height.and.width.mas_equalTo(17);
        make.height.mas_equalTo(17);
        make.width.mas_equalTo(17);
    }];
    
    [self.goodsImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.mainView.mas_centerY).offset(0);
        make.left.mas_equalTo(weakSelf.selectBtn.mas_right).offset(10);
        //make.height.and.width.mas_equalTo(17);
        make.height.mas_equalTo(70);
        make.width.mas_equalTo(70);
    }];
    
    [self.introductionLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mainView.mas_top).offset(10);
        make.left.mas_equalTo(weakSelf.goodsImg.mas_right).offset(10);
        make.right.mas_equalTo(weakSelf.mas_right).offset(0);
        make.height.mas_equalTo(20);
    }];

    [self.needLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.introductionLab.mas_bottom).offset(10);
        make.left.mas_equalTo(weakSelf.introductionLab).offset(0);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(40);
    }];

    [self.needNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.needLab).offset(0);
        make.left.mas_equalTo(weakSelf.needLab.mas_right).offset(0);
        make.height.mas_equalTo(weakSelf.needLab.mas_height).offset(0);
        make.width.mas_equalTo(60);
    }];

    [self.remainedLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.needLab).offset(0);
        make.left.mas_equalTo(weakSelf.needNumLab.mas_right).offset(10);
        make.height.mas_equalTo(weakSelf.needLab.mas_height);
        make.width.mas_equalTo(40);
    }];

    [self.remianedNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.needLab).offset(0);
        make.left.mas_equalTo(weakSelf.remainedLab.mas_right).offset(0);
        make.height.mas_equalTo(weakSelf.needLab.mas_height);
        make.width.mas_equalTo(60);
    }];
    [self.minusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.needLab.mas_bottom).offset(10);
        make.left.mas_equalTo(weakSelf.introductionLab).offset(0);
        make.height.mas_equalTo(24);
        make.width.mas_equalTo(24);
    }];
    ////////////////
    
    [self.winLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.minusBtn).offset(0);
        make.right.mas_equalTo(weakSelf.mas_right).offset(-50);
        make.height.mas_equalTo(10);
        make.width.mas_equalTo(60);
    }];
    
    [self.winNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.winLab.mas_bottom).offset(5);
        make.right.mas_equalTo(weakSelf.winLab).offset(0);
        make.height.mas_equalTo(weakSelf.winLab);
        make.width.mas_equalTo(weakSelf.winLab);
    }];
    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.minusBtn).offset(0);
        make.right.mas_equalTo(weakSelf.winLab.mas_left).offset(-20);
        make.height.mas_equalTo(weakSelf.minusBtn);
        make.width.mas_equalTo(weakSelf.minusBtn);
    }];

    [self.goodsNumTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.minusBtn).offset(0);
        make.right.mas_equalTo(weakSelf.addBtn.mas_left).offset(-10);
        make.left.mas_equalTo(weakSelf.minusBtn.mas_right).offset(10);
        make.height.mas_equalTo(weakSelf.minusBtn);
    }];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
